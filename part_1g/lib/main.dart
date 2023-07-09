import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());

const String appTitle = 'Counter';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: appTitle,   //  used by the OS task switcher
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const  HomePage(),
    );
  }
}   // End of MyApp

class HomePage extends StatelessWidget {
  const  HomePage({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( title: const Text(appTitle) ),
      body:  const  DisplayColumn( ),

    );
  }
} // End of HomePage

class DisplayColumn extends StatelessWidget {
  const  DisplayColumn ({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: const <Widget>[
        Row1Text(),
        DisplayCounterRow( ),
        Row3Widgets(),
        DisplayWordPair(),
      ], // <Widget>[]
    );  // Column
  }
} // End of DisplayColumn

class Row1Text extends StatelessWidget {
  const Row1Text ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 0.0),
      child: Text("wow my very own unique text"),
    );
  }
} // end of Row1Text

class DisplayCounterRow extends StatefulWidget{
  const  DisplayCounterRow ({Key? key }) : super(key: key);

  @override
  MyDisplayCounterState createState( ){
    // The createState method is used to create
    // instances of mutable widgets
    return MyDisplayCounterState( );
  }
}   // End of DisplayCounterRow

class MyDisplayCounterState extends State<DisplayCounterRow> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row (
      children: <Widget> [
        Padding (
          padding: const EdgeInsets.all(8.0), // 8 pixel margins on all sides
          child: ElevatedButton (
                  onPressed: incrementCounter,
                  child: const Text('Increment'),
          ),
        ),

        Text('Counter = $counter'),

        Padding (
          padding: const EdgeInsets.all(8.0), // 8 pixel margins on all sides
          child: ElevatedButton (
            onPressed: decrementCounter,
            child: const Text('Decrement'),
          )
        )
      ]
    );
  } // build

  void incrementCounter() {
    setState(() {
      counter++;
    });
  } // increment counter

  void decrementCounter() {
    setState(() {
      counter--;
    });
  } // decrement counter
} // end of MyDisplayCountState

class Row3Widgets extends StatelessWidget {
  const Row3Widgets ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        Padding (
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.account_balance),
        ),
        Text('Account Balance'), // text
      ]
    );
  } // build
} // end of Row3Widgets

class DisplayWordPair extends StatefulWidget {
  const DisplayWordPair ({Key? key}) : super(key: key);

  @override
  MyDisplayWordPairState createState( ){
    // The createState method is used to create
    // instances of mutable widgets
    return MyDisplayWordPairState() ;
  }
} // end of DisplayWordPair

class MyDisplayWordPairState extends State<DisplayWordPair> {
  WordPair word_pair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return Row (
        children: <Widget> [
          Padding (
            padding: const EdgeInsets.all(8.0), // 8 pixel margins on all sides
            child: ElevatedButton (
              onPressed: generateWordPair,
              child: const Text('Change WordPair'),
            ),
          ),

          Text(word_pair.asPascalCase),
        ]
    );
  } // build

  void generateWordPair() {
    setState(() {
      word_pair = WordPair.random();
    });
  }
}
