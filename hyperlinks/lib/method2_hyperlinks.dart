//      method2_hyperlinks.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

const String _appTitle = 'Method 2 Hyperlinks';

class Method2Display extends StatelessWidget {
  const Method2Display ({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(_appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget> [
            _paragraphs1and2(), // First and second paragraphs
            _paragraph3(), // Third paragraph
            _myParagraph(),
          ],
        ),
      ),
    );
  }
}  // end of Method2Display

RichText _paragraphs1and2 () {
  return RichText(
    text: TextSpan(
      style: const TextStyle(color:
      Colors.black),
      children: <TextSpan>[
        // Paragraph 1
        const TextSpan(
            text: 'Welcome to ',
        ),
        TextSpan(
          text: "Mercer University ",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            decoration:
            TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _displayWebsite("https://mercer.edu"),
        ),
        const TextSpan(
          text:
              "where students from all over the "
              "world discover a college experience "
              "that fits their unique needs, "
              "interests and goals.",
        ),
        _paragraph2(), // Paragraph 2
      ],
    ),
  ); // RichText
} // end of _paragraghs1and2()

TextSpan _paragraph2 (){
  return const TextSpan(
    text: "\nFrom school colors to annual events, "
        "Mercer is packed with proud traditions that "
        "have made the University what it is today.",
  );
}    // end of _paragraph2()

RichText _paragraph3 (){
  // Third paragraph
  return RichText(
    text: const TextSpan(
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text:
                "\nMercer University was founded in "
                "1833 in Penfield by Georgia Baptists. "
                "The school, under the leadership of "
                "Baptist minister and spiritual father "
                "Adiel Sherwood, was named for "
                "Jesse Mercer, a prominent Baptist "
                "leader and the first chair of "
                "the Mercer Board of Trustees. ",
          ),
        ]
    ),
  );
} // end of _paragraph3()

RichText _myParagraph() {
  return RichText(
    text: TextSpan(
      style: const TextStyle(color:
      Colors.black),
      children: <TextSpan>[
        // Paragraph 1
        const TextSpan(
          text: '\nThe ',
        ),
        TextSpan(
          text: "School of Engineering ",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            decoration:
            TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _displayWebsite("https://engineering.mercer.edu/"),
        ),
        const TextSpan(
          text: "has engineers. You can get there by going to ",
        ),
        TextSpan(
          text: "1200 Prince St. Macon, GA 31207. ",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            decoration:
            TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _displayWebsite('https://www.google.com/maps/search/?api=1&query=1200+Prince+St,+Macon,+GA+31207'),
        ),
        const TextSpan(
          text: "You can call them here: ",
        ),
        TextSpan(
          text: "478-301-2748",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            decoration:
            TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _callPhoneNumber("478-301-2748"),
        ),
      ],
    ),
  );
} // end of _myParagraph()

void _displayWebsite (String urlStr) async{
  Uri urlUri = Uri.parse(urlStr);
  try {
    await launchUrl(urlUri);
  } catch (ex) {
    throw 'Could not launch $urlStr';
  }
} // end of _displayWebsite( … )

void _callPhoneNumber(String phoneNumber) async {
    String numberStr = 'tel:$phoneNumber';
    Uri urlUri = Uri.parse(numberStr);
    try {
      await launchUrl(urlUri);
    } catch (ex) {
      throw 'Could not call number';
    }
}