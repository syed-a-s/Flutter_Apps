//     third_page_data.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDo {
  final String toDoTitle;
  final int toDoID;
  final bool   toDoCompleted;

  const ToDo({
    required this.toDoTitle,
    required this.toDoID,
    required this.toDoCompleted,
  });

  // Factory method for parsing a received JSON
  factory ToDo.fromJson(Map<String, dynamic> receivedJson) {
    return ToDo (
        toDoTitle: receivedJson['title'],
        toDoID: receivedJson['id'],
        toDoCompleted: receivedJson['completed'],
    );
  }    // end of factory method
}   // end of ToDo class.

Future< List<ToDo> > fetchToDoListFromWeb() async {
  String dataURL = 'https://jsonplaceholder.typicode.com/todos';

  // make a HTTP network call (or request)
  final response = await http.get( Uri.parse( dataURL ) );

  // if the server returns an OK status code
  if (response.statusCode == 200) {
    // Retrieve the list of JSONs that was
    // sent by the server
    var  jsonListFromServer = jsonDecode(response.body);

    // Use ToDo.fromJson() method to
    // parse (convert) the list of JSONs into
    // a list of ToDos
    var listOfToDos = (jsonListFromServer as List )
                      .map( (jsonListElement) =>
                      ToDo.fromJson( jsonListElement )
                      ).toList();

    return listOfToDos;
  }

  // else, if the server does NOT return an
  // OK status code
  else {
    throw Exception('Failed to fetch list from server');
  }
}		// end of fetchToDoListFromWeb() method