import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());
const String appTitle = "Saadat's Dynamic List";

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
      body: const DisplayCounterAndList(),
    );
  }
} // End of HomePage

class DisplayCounterAndList extends StatefulWidget{

  const DisplayCounterAndList ( {Key? key }) :
        super(key: key );

  // The createState method is used to create
  // instances of mutable widgets

  @override
  MyCounterAndListState  createState() =>
      MyCounterAndListState();

}   // End of DisplayCounterAndList

class MyCounterAndListState extends
State<DisplayCounterAndList>{
  List<String> myList = [];
  String word_pair = '';

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[       // “<Widget>s_one” =
        //   column’s widgets
        Row (
          children: <Widget>[   // row widgets
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton (
                onPressed: incrementCounter,
                child: const Text('Increment'),
              ),
            ),

            Text('Counter = $count'),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: decrementCounter,
                  child: const Text('Decrement'),
                )
            ),

            Text(word_pair),
          ],
        ),

        /* Note:
        *   ListView.builder(...) will not work under
        *   Column (or Row) unless its wrapped inside
        *
        *
        *   the                           widget.
        *   This widget allows Column (or Row) elements
        *   to expand and fill the available space,
        *   which is needed by ListView.builder(...)
        * */

        Expanded (
          child: ListView.builder(
            itemCount:   myList.length,
            itemBuilder: buildListBody,
          ), // ListView.builder
        ),
      ],  // end of “<Widget>s_one” (i.e. column’s// widgets)
    );   // Column
  }

  void incrementCounter( ){
    setState( ( ) {
      count++;
      word_pair = WordPair.random().asPascalCase;
      myList.add(word_pair);
    } ) ;     // setState
  }     // end of incrementCounter()

  void decrementCounter() {
    if(count > 0) {
      setState(() {
        count--;
        word_pair = myList.last;
        myList.removeLast();
      });
    } else {
      setState(() {
        word_pair = '';
      });
    }
  }

  // A Function (or Method) that is
  // called from itemBuilder
  Widget buildListBody(BuildContext ctxt, int curIndx){
    return ListTile(
      title: Text ( myList[curIndx] ),
    );
  }      // end of buildListBody(…)
} // end of MyCounterAndListState

