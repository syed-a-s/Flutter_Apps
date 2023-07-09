// data_file.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

_openMap (String addrFormat) {
  String urlStr;

  if (Platform.isIOS){
    urlStr = 'http://maps.apple.com/?address=$addrFormat';
  } else {     // Platform.isAndroid
    urlStr = 'https://www.google.com/maps/search/?api=1&query=$addrFormat';
  }

  _displayWebsite(urlStr);
} // end of _openMap()

Widget urlText(String urlStr) {
  return GestureDetector(
  child: Text(urlStr,
      style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline
      ),
      textScaleFactor: 1.5,
    ),
    onTap: () => _displayWebsite(urlStr),
  );
}  // urlText

void _displayWebsite (String urlStr) async{
  Uri urlUri = Uri.parse(urlStr);
  try {
    await launchUrl(urlUri);
  } catch (ex) {
    throw 'Could not launch $urlStr';
  }
} // end of _displayWebsite(…)

Widget addressText (String addr, String addrFormat) {
  return GestureDetector(
    child: Text(addr,
      style: const TextStyle(color: Colors.blue,
          decoration:
          TextDecoration.underline ),
      textScaleFactor: 1.5,
    ),
    onTap: () => _openMap(addrFormat),
  );
} // end of addressText

// todo: Class Exercise
Widget phoneText (String phoneNumber) {
  return TextButton(
    onPressed: () async {
      String numberStr = 'tel:$phoneNumber';
      Uri urlUri = Uri.parse(numberStr);
      try {
        await launchUrl(urlUri);
      } catch (ex) {
        throw 'Could not call number';
      }
    },
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(decoration: TextDecoration.underline),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
    ),
    child: Text(
      phoneNumber,
      textScaleFactor: 1.5,
    ),
  );
}  // phoneText