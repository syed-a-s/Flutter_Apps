//  page02_data_file.dart  - contains the Photo object declaration
class Photo {
  final String? title;
  final String? thumbnailUrl;
  final int id;

  Photo({
    required this.title,
    required this.thumbnailUrl,
    required this.id,
  });

  // Factory method for parsing a received JSON
  factory Photo.fromJson(Map<String, dynamic> receivedJson) {
    return Photo(
      title: receivedJson ['title'],
      thumbnailUrl: receivedJson ['thumbnailUrl'],
      id: receivedJson['id'],
    );
  }
}
//  ---- end of page02_data_file.dart -------------