import 'package:cloud_firestore/cloud_firestore.dart';

class LostModel {
  final String name;
  final String description;
  final String location;
  final String image;

  /// Constructor
  const LostModel(
      {required this.description, required this.image, required this.name, required this.location});

  /// convert model to Json structure so that you can it to store data in Firesbase
  toJson() {
    return {
      "name": name,
      "description": description,
      "location": location,
      "image": image,
    };
  }
  factory LostModel.fromJson(Map<String, dynamic> json){
    //print(json["FullName"]);
    return LostModel(
        name: json["name"],
        description: json["description"],
        location: json["location"],
        image: json["image"]
    );
  }

  /// Map Json oriented document snapshot from Firebase to LostModel
  factory LostModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return LostModel(
      description: data["description"],
      image: data["image"],
      name: data["name"],
      location: data["location"],
    );
  }
}