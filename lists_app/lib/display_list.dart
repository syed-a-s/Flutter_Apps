import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data_file.dart';

class MyListDisplay extends StatelessWidget {
  const MyListDisplay ({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:   orgs.length,
      itemBuilder:  _buildListBody,
    );
  }

  Widget _buildListBody (BuildContext context, int index ) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed:() {
            _displayWebsite(context, index);
          },
          child: Text(orgs[index].orgName),
        )
    );
  }

  _displayWebsite(context, index) async {
    String urlStr = orgs[index].orgURL;
    Uri urlUri = Uri.parse(urlStr);

    // Uri.parse converts strings into URIs.
    // Uniform Resource Identifier (URI), a
    // character string that helps in identifying
    // a resource on the Internet

    if(await canLaunchUrl(urlUri)) {
      try {
        await launchUrl(urlUri);
      } catch (ex) {
        // Display an alert dialog here
        throw displayAlert(context, urlStr);
      }
    } else {
      // display an alert dialogue here
      displayAlert(context, urlStr);
    }
  }

  displayAlert(BuildContext context, String url) {
    // Display an alert dialog here
    AlertDialog alrtDialog = AlertDialog(
      content: Text('Could not launch $url'),
    );

    // Display dialog
    showDialog( context: context,
      builder: (context) {
        return alrtDialog;
      },
    );
  }
}
