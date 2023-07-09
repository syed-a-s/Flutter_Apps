import 'package:flutter/material.dart';
import 'data_file.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      // Start the app with route 'first'. In this
      // case, the app starts on the
      // first widget.
      initialRoute: 'first',
      routes: myNavRoutes,
    ); // MaterialApp
  }
}  // end of MyApp
