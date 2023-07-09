//      p0_after_login.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AfterLoginDisplay extends StatelessWidget {
  const AfterLoginDisplay ({Key? key,
    required this.auth,
    required this.fbUser }) :
        super(key: key);

  final FirebaseAuth auth;
  final User fbUser;
  @override
  Widget build(BuildContext context) {
    return _afterLoginPageBody(context);
  }

  Widget  _afterLoginPageBody (BuildContext  context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text(
              'User: ${fbUser.email!}',
            ),
            ElevatedButton(
              child: const Text('View Notes'),
              onPressed: () {
                _navToScreen(context, 'view_notes');
              },
            ),
            ElevatedButton(
              child: const Text('Post Hard-Coded Note'),
              onPressed: () {
                _navToScreen(context, 'post_hard_coded_note');
              },
            ),
            ElevatedButton(
              child: const Text('Post User-Entered Note'),
              onPressed: () {
                _navToScreen(context, 'post_user_entered_note');
              },
            ),
            ElevatedButton(
              child: const Text('Fruits Vote'),
              onPressed: () {
                _navToScreen(context, 'fruits_vote');
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                _logoutUser();
              },
            ),
          ],
        ),
      ),
    );
  } // end of _afterLoginPageBody()

  void _navToScreen(BuildContext context, String page) {
    Navigator.pushNamed(context, page);
  }

  void _logoutUser() async {
    try {
      await auth.signOut();
    } catch (e) {
      //
    } finally {
      //
    }
  }
}   // end of AfterLoginPage Class