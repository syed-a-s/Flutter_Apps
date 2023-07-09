import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String fullName;
  final String city;
  final String companyName;

  const User({
    required this.fullName,
    required this.city,
    required this.companyName,
  });

  // Factory method for parsing a received JSON
  factory User.fromJson(Map<String, dynamic> receivedJson) {
    return User(
      fullName : receivedJson['name'],
      city : receivedJson['address']['city'],
      companyName:  receivedJson ['company']['name'],
    );
  }    // end of factory method
}   // end of User class.

Future<User> fetchUserInfoFromWeb() async {
  String dataURL = 'https://jsonplaceholder.typicode.com/users/3';

  // make a HTTP network call (or request)
  final response =
  await http.get( Uri.parse(     dataURL    ) );

  // if the server returns an OK status code
  if (response.statusCode == 200) {
    // Retrieve JSON that was
    // sent by the server
    var  jsonFromServer = jsonDecode(response.body);

    // Use User.fromJson() method to
    // parse (convert) the received JSON into
    // a new User object
    var  newUserObject = User.fromJson(jsonFromServer);
    return newUserObject;
  }
  // else, if the server does NOT return an
  // OK status code
  else {
    throw Exception('Failed to fetch data');
  }
} // end of fetchUserInfoFromWeb() method
// end of second_page_data.dart