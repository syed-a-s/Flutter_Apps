//      main.dart
import 'package:flutter/material.dart';
import 'package:hyperlinks/home_page.dart';
import 'package:hyperlinks/method2_hyperlinks.dart';
import 'method1_hyperlinks.dart';

const String _appTitle = 'Hyperlinks';
var hyperlinksNavRoutes = <String, WidgetBuilder> {
  'home_screen' : (context) => const MyHomePage(),
  'first_screen' : (context) => const Method1Display(),
  'second_screen' : (context) => const Method2Display(),
};

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home_screen',
      routes: hyperlinksNavRoutes,
    );
  }
} // end of MyApp

class MyHomePage extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appTitle),
      ),
      body: const HomePage(),
    );
  }
}  // end of MyHomePage
