//  f1_counter_display.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterDisplay extends StatefulWidget {
  const CounterDisplay ({Key? key}) : super(key: key);

  @override
  State<CounterDisplay> createState() => _CounterState();
}

class _CounterState extends State<CounterDisplay> {
  final String _counterPrefsKey = 'counter_key';
  String _counterValStr = '';

  @override  			// When is initState() called?
  void initState() {
    super.initState();

    // we will fetch the most recent counter value from
    // shared preferences (storage) in the device

    _getCounterValue().then( (mstRcntCntrVal) {

      // _getCounterValue() is a Future(see line 47).
      // This means that it may take a while for the
      // counter value (mstRcntCntrVal) to be fetched.
      // Instead of using await, which interrupts the
      // program flow, we use then which does NOT
      // interrupt the program flow.
      // After _getCounterValue() has fetched the
      // most recent counter value and returned it via
      // mstRcntCntrVal (see line 27), the code in
      // lines 40 – 43 is executed.

      setState(() {   // what does setState method do?
        _counterValStr = mstRcntCntrVal.toString();
      });  // end of setState  method
    });   // end of then method
  } // end of initState method

  Future<int> _getCounterValue() async {
    // get the shared preferences storage in the
    // device, and store it in prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Search prefs for the integer value stored with
    // key _counterPrefsKey, and
    // store this integer value in variable counterVal.
    // If _counterPrefsKey / int value == null, i.e. does
    // not exist, store 0 (zero) in counterVal.
    int counterVal = prefs.getInt(_counterPrefsKey) ?? 0;

    return counterVal;
  } // end of _getCounterValue()

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            'Counter Value: $_counterValStr',
            textScaleFactor: 1.5
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Increment Counter'),
              ),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: const Text('Decrement Counter'),
              )
            ],
          ),
        ),
      ],
    );
  } // end of build method

  Future<void> _incrementCounter( ) async {
    // get the shared preferences storage in the
    // device, and store it in prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // get the integer value stored with
    // key _counterPrefsKey in prefs.
    // Store this integer value in variable cntrVal.
    // If _counterPrefsKey’s int value == null,
    // make cntrVal = 0 (zero).
    int cntrVal = prefs.getInt(_counterPrefsKey) ?? 0;

    // increment the counter value
    cntrVal++;

    // update shared preference storage
    prefs.setInt(_counterPrefsKey, cntrVal);
    setState(() { // what does setState method do?
      _counterValStr = cntrVal.toString();
    }); // end of setState method
  } // end of _incrementCounter( ) method

  Future<void> _decrementCounter() async {
    // get the shared preferences storage in the device
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // get value with key '_counterPrefsKey' and decrement
    int counterValue = prefs.getInt(_counterPrefsKey) ?? 0;
    counterValue--;

    // update shared preference storage
    prefs.setInt(_counterPrefsKey, counterValue);
    setState(() { // what does setState method do?
      _counterValStr = counterValue.toString();
    }); // end of setState method
  }
}  //  end of _CounterState
// end of f1_counter_display.dart
