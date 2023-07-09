import 'package:flutter/material.dart';
import 'package:firebaseapp/p2_database_post.dart';
import 'package:firebaseapp/p3_textfields_post.dart';
import 'package:firebaseapp/p4_votes_display.dart';
import 'package:firebaseapp/p1_database_display.dart';
import 'package:firebaseapp/main.dart';

class NoteEntry {
  String noteTitle;
  String noteTodo;

  NoteEntry (this.noteTitle, this.noteTodo);

  toJson() {
    return {
      "title": noteTitle,
      "todo": noteTodo,
    };
  }
}

var fBaseAppNavRoutes = <String, WidgetBuilder>{
  'login': (context) => const MyHomePage(), // in main.dart
  'view_notes': (context) => const DatabaseDisplay1(), // in p1_database_display.dart
  'post_hard_coded_note': (context) => const DatabasePost(), // in p2_database_post.dart
  'post_user_entered_note': (context) => const TextFieldsPost(), // in p3_textfields_post.dart
  'fruits_vote': (context) => const VotesDisplay(), // p4_votes_display.dart
};