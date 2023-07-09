// method1_hyperlinks.dart
import 'package:flutter/material.dart';
import 'data_file.dart';
import 'package:url_launcher/url_launcher.dart';

const String _appTitle = 'Method 1 Hyperlinks';

class Method1Display extends StatelessWidget {
  const Method1Display ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(_appTitle),
      ),
      body: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: <Widget>[
            // Mercer University
            const Text(
              'Mercer University' ,
              textScaleFactor: 1.5,
            ),
            addressText(
                "1501 Mercer University Dr,\n"
                    "Macon, GA 31207",
                "1501+Mercer+University+Dr,+Macon,+GA+31207"
            ),
            urlText('https://mercer.edu'),
            ElevatedButton(
              child: const Text(
                  'Call Mercer',
                  textScaleFactor: 1.5
              ),
              onPressed: () async {
                String numberStr = 'tel:800-637-2378';
                Uri urlUri = Uri.parse(numberStr);
                try {
                  await launchUrl(urlUri);
                } catch (ex) {
                  throw 'Could not call number';
                }
              }, // onPressed
            ),

            // School of Engineering
            const Text(
              'School of Engineering',
              textScaleFactor: 1.5,
            ),
            addressText(
                "1200 Prince St.,\n"
                    "Macon, GA 31207",
                "1200+Prince+St,+Macon,+GA+31207"
            ),
            urlText(
                'https://engineering.mercer.edu'
            ),
            phoneText(
                '478-301-2748'
            ),

            // school of music
            const Text(
              'School of Music',
              textScaleFactor: 1.5,
            ),
            addressText(
                "1329 Adams St.,\n"
                    "Macon, GA 31201",
                "1329+Adams+St,+Macon,+GA+31201"
            ),
            urlText(
                'https://music.mercer.edu/'
            ),
            phoneText(
                "478-301-2012"
            ),
          ],
        ),
      );
  }
} // end of Method1Display