//     f2_username_display.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameDisplay extends StatefulWidget {
  const UsernameDisplay ({Key? key}) : super(key: key);

  @override
  State<UsernameDisplay> createState() => _UsernameState();
}

class _UsernameState extends State<UsernameDisplay> {
  final TextEditingController _usernameController = TextEditingController();
  final String _usernamePrefsKey = 'username_key';
  String _usernameDisplayStr = '';

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usernameStr = prefs.getString(_usernamePrefsKey) ?? '';
    _updateUsernameDisplay(usernameStr);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.text,
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            hintText: 'Enter Username Here',
          ),
          onEditingComplete: () {
            _saveUsername();
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _saveUsername,
                child: const Text('Save Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Username: $_usernameDisplayStr',
                  textScaleFactor: 1.5),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    prefs.setString(_usernamePrefsKey, username);
    _updateUsernameDisplay(username);
  }

  void _updateUsernameDisplay(String newUsername){
    setState(() {
      _usernameDisplayStr = newUsername;
    });
  }
}  // end of _UsernameState
