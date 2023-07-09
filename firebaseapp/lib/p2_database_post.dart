//     p2_database_post.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class DatabasePost extends StatefulWidget {
  const DatabasePost ({Key? key}) : super(key: key);

  @override
  State<DatabasePost> createState() => _DatabasePostState();
}

class _DatabasePostState extends State<DatabasePost> {
  final mainReference = FirebaseFirestore.instance.collection('notes').doc();
  String _entryInfo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database Post Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _postEntry,
                child: const
                Text('Submit Entry to Firebase'),
              ),
            ),
            Text(_entryInfo, textScaleFactor: 1.5),
          ],
        ),
      ),
    );
  }

  _postEntry( ) {
    NoteEntry entry = NoteEntry ("Mercer",  "Send Money");
    mainReference.set(entry.toJson());
    setState(() {
      _entryInfo =  'Posted "${entry.noteTitle}"'
          ' / '
          '"${entry.noteTodo}"';
    });
  }     // end of _postEntry()
}  // end of _DatabasePostState