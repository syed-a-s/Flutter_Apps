import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
const String appTitle = 'CheckBox App 2';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: appTitle,   //  used by the OS task switcher
         theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
         home: const HomePage()
     );
   }
 }   // End of MyApp

class HomePage extends StatelessWidget {
  const  HomePage({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(appTitle),
            leading: const IconButton(
                icon: Icon(Icons.access_time_filled),
                tooltip: 'Time',
                onPressed: null,
            ),

            actions: const <Widget> [
              IconButton(
                icon: Icon(Icons.access_alarm),
                tooltip: 'Alarm',
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.add_alert_sharp),
                tooltip: 'Reminders',
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.account_balance),
                tooltip: 'Account Balance',
                onPressed: null,
              ),
            ],
        ),

        body:  const  DisplayButtons()
    );
  }
} // end of HomePage

class DisplayButtons extends StatelessWidget {
   const DisplayButtons ({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Center (
       child: Container(
         child: FlutterList(),
         // color: Colors.grey,
         // height: 150.0,
         // width: 300.0,
       )
     );
   }
 } // end of DisplayButtons

class FlutterList extends StatelessWidget {
   const FlutterList ({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return ListView (
       padding: const EdgeInsets.only(left: 150, right: 150),
       children: const <Widget>[
         DisplayCheckBox2(),
         DisplaySwitch(),
       ]
     );
   }
} // end of FlutterList

class DisplayCheckBox2 extends StatefulWidget {
   const DisplayCheckBox2 ({Key? key}) : super(key: key);

   // the createState method will be used to create instances of mutable widgets
   MyCheckBoxState createState() => MyCheckBoxState();
}

class DisplaySwitch extends StatefulWidget {
   const DisplaySwitch ({Key? key}) : super(key: key);

   // the createState method will be used to create instances of mutable widgets
   MySwitchState createState() => MySwitchState();
}

class MyCheckBoxState extends State<DisplayCheckBox2>{
  MyCheckBoxState ({Key? key });
  bool?  checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Checkbox(
          value:     checkBoxValue,
          onChanged: onChkBox2Clicked,
        )
    );
  }  // end of MyCheckBoxState

  void onChkBox2Clicked(bool? newValue){
    setState( ( ) {
      checkBoxValue = newValue;
    });
  }        // end of onChkBox2Clicked
} // end of MyCheckBoxState

class MySwitchState extends State<DisplaySwitch> {
   MySwitchState ({Key? key});
   bool switchStateValue = true;

   @override
   Widget build(BuildContext context) {
     return Center(
       child: Switch(
         value: switchStateValue,
         onChanged: onSwitchClicked,
       )
     );
   }

   void onSwitchClicked(bool newValue) {
     setState(() {
       switchStateValue = newValue;
     });
   } // end of onSwitchClicked
} // end of MySwitchState

