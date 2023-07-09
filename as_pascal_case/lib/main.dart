// ------ Beginning of main.dart --------------------
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'My Second Flutter App',
        theme: ThemeData( primarySwatch: Colors.blue, ),
        home: const HomePage(
            homePageTitle: 'Startup Namer'
        )
    );
  }
} // end of MyApp
class HomePage extends StatelessWidget {
  const
  HomePage({Key? key, required this.homePageTitle }) :
        super(key: key);
  final String homePageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text( homePageTitle ) ),
        body: const FlutterList2() );
  }
} // end of HomePage
class HelloFlutterText extends StatelessWidget {
  const HelloFlutterText ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WordPair myWords = WordPair.random();
    return Center(
        child: Text( myWords.asPascalCase,
            textDirection: TextDirection.ltr,
            style: const TextStyle(fontSize: 48.0,
                fontWeight: FontWeight.bold)
        )
    );
  }
} // end of HelloFlutterText
class FlutterList extends StatelessWidget {
  const FlutterList ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WordPair myWords = WordPair.random();
    return ListView(
        children: <Widget>[
          ListTile(
              title: Text(myWords.asPascalCase)
          ),
          ListTile(
              title: Text(myWords.asPascalCase)
          ),
          ListTile(
              title: Text(myWords.asPascalCase)
          ),
        ]
    );
  }
} // end of FlutterList
class FlutterList2 extends StatelessWidget {
  const FlutterList2 ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final WordPair a = WordPair.random();
    final WordPair b = WordPair.random();
    final WordPair c = WordPair.random();
    final WordPair d = WordPair.random();
    final WordPair e = WordPair.random();
    return ListView(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.accessible_forward_sharp),
              title: Text(a.asPascalCase)
          ),
          ListTile(
              leading: Icon(Icons.photo_album),
              title: Text(b.asPascalCase)
          ),
          ListTile(
              leading: Icon(Icons.adb),
              title: Text(c.asPascalCase)
          ),
          ListTile(
              leading: Icon(Icons.phone),
              title: Text(d.asPascalCase)
          ),
          ListTile(
              leading: Icon(Icons.map),
              title: Text(e.asPascalCase)
          ),
        ]
    );
  }
} // end of FlutterList2
// --------------------- End of main.dart ----------