//      p0_after_login.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PasswordManagerPage extends StatefulWidget {
  const PasswordManagerPage({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordManagerPageState();
}

class _PasswordManagerPageState extends State<PasswordManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async => await _logout(context),
          ),
        ],
      ),
      body: const PasswordListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPasswordDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    } catch (e) {
      //
    } finally {
      //
    }
  }

  void _showAddPasswordDialog() {
    String site = '';
    String username = '';
    String password = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Site'),
              onChanged: (value) => site = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) => username = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (value) => password = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add the password
              addNewPassword(site, username, password);
              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void addNewPassword(String site, String username, String password) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      // Check if the user is logged in
      if (user != null) {
        // Get the user's email
        String email = user.email ?? '';

        // Create a collection reference using the user's email
        CollectionReference userCollection = FirebaseFirestore.instance.collection(email);

        // Add the new document with the provided fields
        await userCollection.add({
          'site': site,
          'username': username,
          'password': password,
        });

        // Document added successfully
        print('New password added!');
      } else {
        // User is not logged in
        print('User is not logged in.');
      }
    } catch (e) {
      // Error occurred while adding the document
      print('Error adding new password: $e');
    }
  }
}

class PasswordListWidget extends StatefulWidget {
  const PasswordListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordListWidgetState();
}

class _PasswordListWidgetState extends State<PasswordListWidget> {
  late final User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return const Center(child: Text('No saved passwords'));
    }

    final userCollection = FirebaseFirestore.instance
        .collection(currentUser!.email!) // Use the user's email as the collection name
        .orderBy('site', descending: false); // Sort the documents by 'site' field

    return StreamBuilder<QuerySnapshot>(
      stream: userCollection.snapshots(),
      builder: (context, snapshot) {
        // wait for data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // show error
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final documents = snapshot.data?.docs ?? [];

        if (documents.isEmpty) {
          return const Center(child: Text('No saved passwords'));
        }

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final password = documents[index].data();
            final documentId = documents[index].id;

            final site = (password as Map<String, dynamic>)['site'] ?? '';
            final username = (password as Map<String, dynamic>)['username'] ?? '';
            final passwordValue = (password as Map<String, dynamic>)['password'] ?? '';

            return GestureDetector(
              onTap: () => _showActionDialog(documentId, password),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      site,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Username: $username',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Password: $passwordValue',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
  void _showActionDialog(String documentId, Map<String, dynamic> password) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Password Actions'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Copy to Clipboard'),
                onTap: () {
                  _copyToClipboard(password['password']);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Password'),
                onTap: () {
                  _deletePassword(documentId);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _copyToClipboard(String password) {
    Clipboard.setData(ClipboardData(text: password));
    const snackBar = SnackBar(
      content: Text('Password copied to clipboard'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _deletePassword(String documentId) {
    final userCollection = FirebaseFirestore.instance.collection(currentUser!.email!);
    final documentReference = userCollection.doc(documentId);

    documentReference.delete().then((_) {
      const snackBar = SnackBar(
        content: Text('Password deleted'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((error) {
      final snackBar = SnackBar(
        content: Text('Failed to delete password: $error'),
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}