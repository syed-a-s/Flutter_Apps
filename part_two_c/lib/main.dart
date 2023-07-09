import 'package:flutter/material.dart';
import 'package:part_two_c/flex_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String appTitle = 'Contacts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: Scaffold(
          appBar: AppBar( title: Text(appTitle) ),
          body:  const FlexWidget(),
        )
    );
  }
}   // End of MyApp
