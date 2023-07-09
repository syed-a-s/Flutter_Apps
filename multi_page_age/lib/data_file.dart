import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';

const String appTitle = 'Multi Page App';
const String screen2Title = appTitle;

class Website {
  String name;
  String url;

  // constructor
  Website(this.name, this.url);
}

List<Website> myWebsiteList = [
  Website('Go Bears', 'https://mercerbears.com'),
  Website('Facebook', 'https://facebook.com'),
  Website('IEEE', 'https://www.ieee.org'),
];

  var myNavRoutes = <String, WidgetBuilder>{
    'first': (context) => const  FirstScreen(),
    'second': (context) => const SecondScreen(),
  };
