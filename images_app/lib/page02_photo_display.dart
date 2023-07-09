//  page02_photo_display.dart  - Displays the Photo object’s variables (see page 7)
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'page02_data_file.dart';

class PhotoDisplay extends StatefulWidget {
  const PhotoDisplay ({Key? key}) : super(key: key);

  @override
  State<PhotoDisplay> createState() => _PhotoDisplayState();
}

class _PhotoDisplayState extends State<PhotoDisplay> {
  bool isLoading = true;
  late Photo photoFromWeb;

  @override
  void initState() {
    super.initState();
    _fetchPhotoInfoFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2 Photo Display Page"),
      ), // AppBar

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading ? _loadingDisplay() :
        _photoDisplay(),
      ), // Padding
    ); // Scaffold
  } // build

  Future<void> _fetchPhotoInfoFromWeb() async {
    String dataURL = 'https://jsonplaceholder.typicode.com/photos/4980';

    // make a HTTP network call
    final http.Response response = await http.get(Uri.parse(dataURL));

    // if the server returns an OK status, parse the
    // resulting response JSON into a Photo object

    if (response.statusCode == 200) {
      var receivedJson = json.decode(response.body);
      photoFromWeb = Photo.fromJson(receivedJson);
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  } // end of fetchPhotoInfoFromWeb()

  Widget _loadingDisplay() {
    // The display while
    // the app is
    // loading data from the web
    return const Center(
      child: CircularProgressIndicator(),
    );
  } // end of _loadingDisplay()

  Widget _photoDisplay() {
    // The display while the app is
    // NOT loading data from the web
    Widget displayWidget;

    if (photoFromWeb.title == null || photoFromWeb.thumbnailUrl == null) {
      displayWidget = const Text("\nNULL DATA encountered", textScaleFactor: 1.5);
    } else {
      String displayTxt = '\ntitle: \n'
          '${photoFromWeb.title!}'
          '\n\nthumbnail image: \n';

      displayWidget = Column(
        children: <Widget>[
          Text(displayTxt, textScaleFactor: 1.5),
          displayWidget = ClipOval(
            child: Image.network(
              photoFromWeb.thumbnailUrl!,
              fit: BoxFit.cover,
              width: 90.0,
              height: 90.0,
            ),
          ),
        ],
      );
    }

    return displayWidget;
  }
}// end of _photoDisplay()
// end of page02_photo_display.dart

