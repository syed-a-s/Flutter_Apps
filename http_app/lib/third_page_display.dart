import 'package:flutter/material.dart';
import 'third_page_data.dart';

class ThirdPageDisplay extends StatefulWidget {
  const ThirdPageDisplay({Key? key}) : super(key: key);
  @override
  State<ThirdPageDisplay> createState() => _ThirdPageDisplayState();
}

class _ThirdPageDisplayState extends State<ThirdPageDisplay> {
  late Future< List<ToDo> > toDoList; // init when first called

  @override
  void initState() {
    super.initState();
    toDoList = fetchToDoListFromWeb();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page – To Do List'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:	FutureBuilder< List<ToDo> >(
            future: 	toDoList	, // future object
            builder:  _page3FutureBuilderMethod,
          ),
        ),
      ),
    );
  } // build
} // end of _ThirdPageDisplayState

Widget _page3FutureBuilderMethod(BuildContext context, AsyncSnapshot< List<ToDo> >  snapshot) {
  Widget futureBuilderResult;

  if (snapshot.hasData) {
    futureBuilderResult = _snapshotDataDisplayWidget(snapshot);
  } else if (snapshot.hasError) {
    futureBuilderResult =  Text("${snapshot.error}");
  } else {
    futureBuilderResult = const
    CircularProgressIndicator();
  }

  return futureBuilderResult;
}

Widget _snapshotDataDisplayWidget(AsyncSnapshot< List<ToDo> >  snapshot) {
  return ListView.builder(
    itemCount:   snapshot.data!. length ,
    itemBuilder:
        (BuildContext context, int index) =>
        _toDoListItemBuilder(snapshot, index),
  );
}

Widget _toDoListItemBuilder (AsyncSnapshot< List<ToDo> >  snapshot, int index){
  String subTitleID = 'ID : ${snapshot.data![index].toDoID.toString()}';
  String subTitleCompleted = 'Completed: ${snapshot.data![index].toDoCompleted. toString()}';
  return ListTile(
    title: Text(snapshot.data![index].toDoTitle ),
    subtitle: Text('$subTitleID\n$subTitleCompleted'),
  );
}	// _toDoListItemBuilder( … )
// end of third_page_display.dart