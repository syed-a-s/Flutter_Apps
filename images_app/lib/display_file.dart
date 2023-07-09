//  			display_file.dart
import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage ({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images App'),
      ),
      body: _displayImageBody(context),
    );
  } // build (…)

  Widget _displayImageBody(BuildContext context) {
    return Center(
      child:  Column(
        children: <Widget>[
          Padding (
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/uc.jpg' ,
              // width: 100.0, height: 100.0,
            ), // Image.asset
          ),  // Padding

          const Text('The University Center', textScaleFactor: 1.5),

          SizedBox(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Page 2 Photo'),
                onPressed: () {
                  _navToScreen(context, 'second');
                },
              ),
            ),
          ),

          SizedBox(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Page 3 Photo List'),
                onPressed: () {
                  _navToScreen(context, 'third');
                },
              ),
            ),
          ),

        ],
      ),
    );
  }// end of _displayImageBody

  void _navToScreen(BuildContext context, String page) async {
    Navigator.pushNamed(context, page);
  }
} // end of DisplayImage class
// --- end of display_file.dart