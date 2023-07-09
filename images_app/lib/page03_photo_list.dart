// page03_photo_list.dart
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'page02_data_file.dart';

class PhotoListDisplay extends StatefulWidget {
  const PhotoListDisplay ({Key? key}) : super(key: key);

  @override
  State<PhotoListDisplay> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoListDisplay> {
  bool isLoading = true;
  late List<Photo>  photoListFromWeb;

  @override
  void initState() {
    super.initState();
    _fetchPhotoList();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 3 Photo List"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading ? _loadingDisplay () :
        _photoListDisplay(),
      ),
    );
  }

  Future<void> _fetchPhotoList() async{
    String dataURL = 'https://jsonplaceholder.typicode.com/photos';

    // make a HTTP network call
    final http.Response response = await http.get( Uri.parse( dataURL ) );

    // if the server returns an OK status, parse the
    // resulting response JSON into a list of objects
    if (response.statusCode == 200) {
      var jsonResponseFromServer = json.decode(response.body);

      photoListFromWeb = ( jsonResponseFromServer as List).map((elementFromJsonList) =>
          Photo.fromJson(elementFromJsonList)
      ).toList();

      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget _loadingDisplay (){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _photoListDisplay() {
    return ListView.builder(
      itemCount: photoListFromWeb.length,
      itemBuilder: (BuildContext context, int index) => _photoListItemBuilder(index),
    );
  }

  Widget _photoListItemBuilder (int index){
    return ListTile(
      title: Text( photoListFromWeb[index].title!),
      subtitle: Text('id : ${photoListFromWeb[index].id.toString()!}'),
      leading: ClipOval(
        child: Image.network(
          photoListFromWeb[index].thumbnailUrl!,
          fit: BoxFit.cover,
          width: 90.0,
          height: 90.0,
        ),
      ),
    );
  }
} // end of _PhotoListState
// end of page03_photo_list.dart
