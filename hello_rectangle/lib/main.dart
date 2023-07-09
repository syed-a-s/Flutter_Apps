// ------------------ Beginning of main.dart  ----------
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
const String appTitle = 'Hello Rectangle';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,   //  used by the
        // OS task switcher
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(
            homePageTitle: appTitle
        )
    );
  }
}         // end of MyApp

class HomePage extends StatelessWidget {
  const
  HomePage({Key? key, required this.homePageTitle }) :
        super(key: key);
  final String homePageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( title: Text(homePageTitle)),
      body: const  DisplayRectangle(),
    );
  }
} // end of HomePage
// ---------------end Step 2b code -------

// --------------- Beginning of Step 2a code --------
class DisplayRectangle extends StatelessWidget{
  const DisplayRectangle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center (
      child: Container(   // The rectangle

        // Add rectangle's color, height, width, and
        // child here
        // Hint: The rectangle's child should be
        // DisplayWelcome

        color: Colors.redAccent,
        height: 150.0,
        width: 300.0,
        child: FlutterList(

        ),
      ),
    );
  }
}     // end of DisplayRectangle
class DisplayWelcome extends StatelessWidget{
  const DisplayWelcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center (
      // Add the text widget here
      child: Text(
          'Yooo I made some custom text!'
      )
    );
  }
}      // end of DisplayWelcome
// ---------------end Step 2a code --------

class HelloRectangle extends StatelessWidget {
  const HelloRectangle ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.greenAccent,
        height: 400.0,
        width: 300.0,
        child: const Center(
          child: Text(
            'Hello!',
            style: TextStyle(fontSize: 40.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}        // End of HelloRectangle

class FlutterList extends StatelessWidget {
  const FlutterList ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const <Widget>[
          ListTile(
              leading: Icon(Icons.add_business),
              title:  Text('Chipotle')
          ),
          ListTile(
              leading: Icon(Icons.add_circle_outline),
              title:  Text('Circle')
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Alarm')
          ),
        ]
    );
  }
}   // end of FlutterList

// --------------------- End of main.dart  ----------