//     third_page_data.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String userName;
  final String userCity;
  final String userLat;
  final String userLng;
  final int userID;

  const User({
    required this.userName,
    required this.userCity,
    required this.userLat,
    required this.userLng,
    required this.userID,
  });

  // Factory method for parsing a received JSON
  factory User.fromJson(Map<String, dynamic> receivedJson) {
    return User (
      userName: receivedJson['name'],
      userCity: receivedJson['address']['city'],
      userLat: receivedJson['address']['geo']['lat'],
      userLng: receivedJson['address']['geo']['lng'],
      userID: receivedJson['id'],
    );
  }    // end of factory method
}   // end of User class.

Future<List<User>> fetchUserListFromWeb() async {
  String dataURL = 'https://jsonplaceholder.typicode.com/users';

  // make a HTTP network call (or request)
  final response = await http.get( Uri.parse( dataURL ) );

  // if the server returns an OK status code
  if (response.statusCode == 200) {
    // Retrieve the list of JSONs that was
    // sent by the server
    var  jsonListFromServer = jsonDecode(response.body);

    // Use User.fromJson() method to
    // parse (convert) the list of JSONs into
    // a list of Users
    var listOfUsers = (jsonListFromServer as List )
        .map( (jsonListElement) =>
        User.fromJson( jsonListElement )
    ).toList();

    return listOfUsers;
  }

  // else, if the server does NOT return an
  // OK status code
  else {
    throw Exception('Failed to fetch list from server');
  }
}		// end of fetchUserListFromWeb() method