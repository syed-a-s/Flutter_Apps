//  f3_other_displays.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class OtherDisplays extends StatefulWidget {
  const OtherDisplays ({Key? key}) : super(key: key);

  @override
  State<OtherDisplays> createState() => _OtherDisplaysState();
}

class _OtherDisplaysState extends State<OtherDisplays> {
  bool isChecked  = false;
  bool isSwitched = true;
  final String _isCheckedKey = 'is_checked_key';
  final String _isSwitchedKey = 'is_switched_key';

  @override
  void initState() {
    super.initState();
    _getStates();
  }

  _getStates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isChecked = prefs.getBool(_isCheckedKey) ?? false;
    isSwitched = prefs.getBool(_isSwitchedKey) ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          // CheckboxListTile instead of
          // Checkbox because  CheckboxListTile
          // allows us to use "title:"
          title: const Text('Setting A', textScaleFactor: 1.5),
          value: isChecked,
          onChanged: (newValue) {
            setState(() {
              isChecked = newValue!;
              _saveState(_isCheckedKey, newValue);
            });
          },
          // controlAffinity: ListTileControlAffinity.leading,
        ),
        SwitchListTile(
          // SwitchListTile instead of
          // Switch because SwitchListTile
          // allows us to use "title:"
          title: const Text('Setting B', textScaleFactor: 1.5),
          value: isSwitched,
          onChanged: (newValue) {
            setState(() {
              isSwitched = newValue;
              _saveState(_isSwitchedKey, newValue);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _resetSharedPreferences,
            child: const Text('Reset')
          )
        ),
      ],
    );
  }

  Future<void> _saveState(String stateKey, bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(stateKey, state);
  }

  Future<void> _resetSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isCheckedKey, false);
    prefs.setBool(_isSwitchedKey, true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }
} // end of _OtherDisplaysState