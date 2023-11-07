import 'package:cloud_firestore/cloud_firestore.dart';

class TutorModel {
  final String? id;
  final String name;
  final String email;
  final String phoneNo;
  final String image;
  final List<String> subjects;
  final List<String> topics;

  /// Constructor
  const TutorModel(
      {this.id, required this.name, required this.email, required this.phoneNo,  required this.image, required this.subjects, required this.topics});

  /// convert model to Json structure so that you can it to store data in Firesbase
  toJson() {
    return {
      "name": name,
      "email": email,
      "phoneNo": phoneNo,
      "image": image,
      "subjects": subjects,
      "topics": topics
    };
  }

  /// Map Json oriented document snapshot from Firebase to LostModel
  factory TutorModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TutorModel(
      id: document.id,
      name: data["name"],
      email: data["email"],
      phoneNo: data["phoneNo"],
      image: data["image"],
      subjects: List<String>.from(document['subjects']),
      topics: List<String>.from(document['topics']),
    );
  }
}