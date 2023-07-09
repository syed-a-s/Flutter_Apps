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
      title: appTitle,   //  used by the OS task switcher
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const HelloRectangle(),
      ),
    );
  }
}         // End of MyApp
// CONTINUE ON NEXT PAGE

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