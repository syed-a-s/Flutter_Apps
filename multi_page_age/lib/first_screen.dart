import 'package:flutter/material.dart';
import 'data_file.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen ({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    const String screenTitle = '$appTitle - First Screen';

    return Scaffold(
      appBar: AppBar(title: const Text(screenTitle)),
      body: _firstScreenBody(context),
    );
  }

  Widget _firstScreenBody(BuildContext context) {
    return ListView.builder(
        itemCount: myWebsiteList.length,
        itemBuilder: _buildListBody
    );
  } // end of _firstScreenBody()

  Widget _buildListBody(BuildContext context, int index) {
    return ListTile(
      title: Text(myWebsiteList[index].name),
      onTap: () => _navToScreen2(context, index),
    );
  } // end of _buildListBody

  void _navToScreen2(BuildContext context, int websiteListIndex) async {
    // Navigate to the second screen
    final result = await Navigator.pushNamed(context, 'second', arguments: websiteListIndex) ?? Website("","");

    // cast result as a "Website" class
    Website receivedData = result as Website;

    // add data to list
    if(receivedData.name.isNotEmpty && receivedData.url.isNotEmpty) {
      myWebsiteList.add(receivedData);
    }

    // after screen 2 returns data, redraw screen 1
    setState(() {

    });
  } // end of _navToScreen2()
} // end of FirstScreen Class
