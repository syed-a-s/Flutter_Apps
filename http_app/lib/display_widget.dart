//  display_widget.dart – Example 1
import 'package:flutter/material.dart';
import 'data_file.dart';

// DisplayPost uses a    	FutureBuilder	   widget
// to display the data that it receives from the web.
//
// FutureBuilder is a Flutter widget that returns another widget based on a future’s execution result.
// (A future represents the result of asynchronous operations to be completed later).
//
// A FutureBuilder serves as a bridge between futures and a widget’s
//
//                UI                   .

class DisplayPost extends StatefulWidget {
  const DisplayPost({Key? key}) : super(key: key);

  @override
  State<DisplayPost> createState() => _DisplayPostState();
}

class _DisplayPostState extends State<DisplayPost> {
  // late means that a variable will be initialized
  // later, i.e. when the
  // variable is accessed
  late Future<Post> postDataFromWeb;

  @override
  void initState() {
    // initState() is called only once.
    // It is used for one time initializations.

    super.initState();
    // post meaning posting data
    postDataFromWeb = fetchPostDataFromWeb();
  }  // end of initState()

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const // see page 3
        Text('  Fetch Data from Web	 '),
      ),

      body: FutureBuilder<Post>(
        future: postDataFromWeb,
        builder: _futureBuilderDisplayMethod,
      ),
    );
  }// build (…)

  Widget _futureBuilderDisplayMethod(BuildContext context, AsyncSnapshot<Post> snapshot) {
   // AsyncSnapshot = representation of the most recent
   // interaction with an  asynchronous computation.
    Widget displayedWidget;

    if (snapshot.hasData) {
      displayedWidget = _snapshotDataDisplayWidget(snapshot);
    } else if (snapshot.hasError) {
      displayedWidget =  Text("${snapshot.error}");
      // wait for data – show loading screen
    } else {
      displayedWidget = const
      CircularProgressIndicator();
    }

    return displayedWidget;
  }  // end of _futureBuilderDisplayMethod

  Widget _snapshotDataDisplayWidget(AsyncSnapshot<Post> snapshot) {
    // snapshot.data! = we are sure that snapshot.data is never null
    String theTitle = snapshot.data!.postTitle;
    String userIDStr = snapshot.data!.postUserId.toString();
    String idStr = snapshot.data!.postId.toString();
    String bodyStr = snapshot.data!.postBody;

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: <Widget>[
          Text('Title : $theTitle'),
          Text('User ID : $userIDStr'),
          Text('ID : $idStr'),
          const Text('Body :'),
          Text(bodyStr),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('Go to Page 2'),
              onPressed: () {
                // go to second page
                _navToScreen(context, 'second');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('Go to Page 3'),
              onPressed: () {
                // go to third page
                _navToScreen(context, 'third');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('Go to Page 4'),
              onPressed: () {
                // go to fourth page
                _navToScreen(context, 'fourth');
              },
            ),
          ),
        ],
      ),
    );
  } // end of snapshotDataDisplayWidget

  void _navToScreen(BuildContext context, String page) async {
    // navigate to second screen
    Navigator.pushNamed(context, page);
  }
} // end of _DisplayPostState class

// ------------- End of display_widget.dart ------