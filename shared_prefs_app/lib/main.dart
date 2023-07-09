//     main.dart
import 'package:flutter/material.dart';
import 'f1_counter_display.dart';
import 'f2_username_display.dart';
import 'f3_other_displays.dart';

const String _appTitle = 'Shared Preferences Demo';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage( ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const <Widget>[
            CounterDisplay(),
            UsernameDisplay(),
            OtherDisplays(),
          ],
        ),
      ),
    );
  } // build
}  // end of MyHomePage
// end of main.dart
