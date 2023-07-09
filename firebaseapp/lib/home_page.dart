// home_page.dart
import 'package:flutter/material.dart';

class DisplayHomePage extends StatelessWidget {
  const DisplayHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Firebase Demo"),
        ),
        body: _displayHomePageBody(context),
      );
  }

  Widget _displayHomePageBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ElevatedButton(
                child: const Text('View Notes'),
                onPressed: () {
                  _navToScreen(context, 'first');
                },
            ),
            ElevatedButton(
                  child: const Text('Post Hard-Coded Note'),
                  onPressed: () {
                    _navToScreen(context, 'second');
                  },
            ),
            ElevatedButton(
                  child: const Text('Post User-Entered Note'),
                  onPressed: () {
                    _navToScreen(context, 'third');
                  },
            ),
            ElevatedButton(
              child: const Text('Fruits Vote'),
              onPressed: () {
                _navToScreen(context, 'fourth');
              },
            )
          ],
        ),
      ),
    );
  }

  void _navToScreen(BuildContext context, String page) async {
    Navigator.pushNamed(context, page);
  }
} // end of DisplayHomePage class
