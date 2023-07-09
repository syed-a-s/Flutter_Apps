import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class TextFieldsPost extends StatefulWidget {
  const TextFieldsPost ({Key? key}) : super(key: key);

  @override
  State<TextFieldsPost> createState() => _TextFieldsPostState();
}

class _TextFieldsPostState extends State<TextFieldsPost> {
  final mainReference = FirebaseFirestore.instance.collection('notes').doc();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _todoController = TextEditingController();
  String _entryInfo = '';

  @override
  void dispose() {
    _titleController.dispose();
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Post Page 2'),
      ),
      body: GestureDetector( // required to dismiss the
        //  keyboard when the user
        // cancels a text field entry by
        // tapping outside the keyboard
        onTap: () { // this dismisses the keyboard
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              // Add text fields here,
              TextField(
                keyboardType: TextInputType.text,
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter Title Here',
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _todoController,
                decoration: const InputDecoration(
                  labelText: 'Todo',
                  hintText: 'Enter Todo Here',
                ),
              ),
              ElevatedButton(
                onPressed: _postEntry,
                child: const Text('Submit TextField Entries to Firebase'),
              ),
              ElevatedButton(
                onPressed: _clearEntry,
                child: const Text('Clear Entries'),
              ),
              Text(_entryInfo, textScaleFactor: 1.5),
            ],
          ),
        ),
      ),
    );
  }

  void _postEntry() {
    if(_titleController.text.isEmpty || _todoController.text.isEmpty) {
      _entryInfo = 'No entry was submitted';
    } else {
      NoteEntry entry = NoteEntry (_titleController.text,  _todoController.text);
      mainReference.set(entry.toJson()); // send to firebase
      _entryInfo =  'Posted "${entry.noteTitle}"'
          ' / '
          '"${entry.noteTodo}"';
    }
    setState((){});
  }

  void _clearEntry() {
    _titleController.clear();
    _todoController.clear();
    setState(() {
      _entryInfo = 'Entries Cleared';
    });
  }
}  // end of _TextFieldsPostState