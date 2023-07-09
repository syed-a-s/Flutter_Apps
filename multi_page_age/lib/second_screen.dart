import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data_file.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataFromScreen1 = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar:  AppBar( title: const Text('$screen2Title - Second Screen')),
      body: _secondScreenBody(context, dataFromScreen1),
    );
  } // end of build

  Widget _secondScreenBody (BuildContext context, int prevScreenData) {
    return Padding (
      padding: const EdgeInsets.all(8.0),

      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            _firstRow(context, prevScreenData),

            const TextFieldsAndButtonRows(),

            ElevatedButton(
              child: const Text('Go Back'),
              onPressed: ( ) {
                // Pop Second Screen here
                Navigator.pop(context);
              },
            ),
          ]
      ),
    );
  } // end of _secondScreenBody()
} // end of SecondScreen Class

Widget _firstRow (BuildContext context, int indexFromPrevScreen){
  return Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Text('Browse to'),
          onPressed: () {
            // go to website
            _displayWebsite(context, indexFromPrevScreen);
          },
        ),
      ),
      Text(myWebsiteList[indexFromPrevScreen].name),
    ],
  );
} // end of _firstRow

_displayWebsite(BuildContext context, int index) async {
  String urlStr = myWebsiteList[index].url;
  Uri urlUri = Uri.parse(urlStr);

  try {
    await launchUrl(urlUri);
  } catch (ex) {
    // Display an alert dialog here
    throw displayAlert(context, urlStr);
  }
} // end of _displayWebsite

displayAlert(BuildContext context, String url) {
  // Display an alert dialog here
  AlertDialog alertDialog = AlertDialog(
    content: Text('Could not launch $url'),
  );

  // Display dialog
  showDialog( context: context,
    builder: (context) {
      return alertDialog;
    },
  );
} // end of displayAlert

class TextFieldsAndButtonRows extends StatefulWidget {
  const TextFieldsAndButtonRows({Key? key }) :
        super(key: key);

  @override
  State<TextFieldsAndButtonRows> createState() =>
      _TextFieldsAndButtonState();
} // end of TextFieldsAndButtons

class _TextFieldsAndButtonState extends State<TextFieldsAndButtonRows>  {
  final TextEditingController _nameController =
  TextEditingController();

  final TextEditingController _urlController  =
  TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when
    // the Widget is disposed
    _nameController.dispose();
    _urlController.dispose();
    // parent dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        // add first TextField here - name TextField
        TextField(
          keyboardType: TextInputType.name,
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter Name Here',
            )
        ),

        // add second TextField here - url TextField
        TextField(
          keyboardType: TextInputType.url,
          controller: _urlController,
          decoration: const InputDecoration(
            labelText: 'URL',
            hintText: 'Enter URL Here',
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child:  const Text('Add data to'
                '\nScreen 1 List'),
            onPressed: () =>
                _getDataFromTextFields(context),
          )
        )
      ],
    );
  } // end of build method

  void _getDataFromTextFields(BuildContext context) {
    // Retrieve data from TextFields
    // e.g.
    //  Website sendData = ...
    Website sendData = Website(
        _nameController.text,
        _urlController.text
    );

    // Pop the Second Screen and send data to
    // the First Screen
    Navigator.pop(context, sendData);
  }
}  // end of _TextFieldsAndButtonState class