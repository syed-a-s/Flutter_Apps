//                main.dart – Example 1
import 'package:flutter/material.dart';
import 'package:http_app/data_file.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data from Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'first',
      routes: myNavRoutes,
    );
  }
}  // end of MyApp

// ------------- End of main.dart --------------

