// home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Method 1 Hyperlinks'),
              onPressed: () {
                _navToScreen(context, 'first_screen');
              },
            ),
            ElevatedButton(
              child: const Text('Method 2 Hyperlinks'),
              onPressed: () {
                _navToScreen(context, 'second_screen');
              },
            ),
          ]
        ),
      ),
    );
  }

  void _navToScreen(BuildContext context, String page) {
    Navigator.pushNamed(context, page);
  }
}