import 'package:flutter/material.dart';
import 'package:images_app/display_file.dart';
import 'package:images_app/page02_photo_display.dart';
import 'package:images_app/page03_photo_list.dart';

var myNavRoutes = <String, WidgetBuilder>{
  'first': (context) => const  DisplayImage(),
  'second': (context) => const PhotoDisplay(),
  'third': (context) => const PhotoListDisplay(),
};