import 'package:flutter/material.dart';
import 'fourth_page_data.dart';

class FourthPageDisplay extends StatefulWidget {
  const FourthPageDisplay({Key? key}) : super(key: key);
  @override
  State<FourthPageDisplay> createState() => _FourthPageDisplayState();
}

class _FourthPageDisplayState extends State<FourthPageDisplay> {
  late Future< List<User> > userList; // init when first called

  @override
  void initState() {
    super.initState();
    userList = fetchUserListFromWeb();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Page - Users List'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:	FutureBuilder< List<User> >(
            future: 	userList	, // future object
            builder:  _page3FutureBuilderMethod,
          ),
        ),
      ),
    );
  } // build
} // end of _ThirdPageDisplayState

Widget _page3FutureBuilderMethod(BuildContext context, AsyncSnapshot<List<User>>  snapshot) {
  Widget futureBuilderResult;

  if (snapshot.hasData) {
    futureBuilderResult = _snapshotDataDisplayWidget(snapshot);
  } else if (snapshot.hasError) {
    futureBuilderResult =  Text("${snapshot.error}");
  } else {
    futureBuilderResult = const CircularProgressIndicator();
  }

  return futureBuilderResult;
}

Widget _snapshotDataDisplayWidget(AsyncSnapshot<List<User>> snapshot) {
  return ListView.builder(
    itemCount:   snapshot.data!. length,
    itemBuilder:
        (BuildContext context, int index) =>
        _userListItemBuilder(snapshot, index),
  );
}

Widget _userListItemBuilder (AsyncSnapshot<List<User>> snapshot, int index){
  String subTitle1 = 'ID: ${snapshot.data![index].userID.toString()} City: ${snapshot.data![index].userCity}';
  String subTitle2 = 'Latitude: ${snapshot.data![index].userLat} Longitude: ${snapshot.data![index].userLng}';

  return ListTile(
    title: Text(snapshot.data![index].userName),
    subtitle: Text('$subTitle1\n$subTitle2')
  );
}	// _userItemBuilder( … )
// end of fourth_page_display.dart