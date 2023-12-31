import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final int steps;

  /// Constructor
  const UserModel(
      {this.id, required this.email, required this.password, required this.fullName, required this.phoneNo,required this.steps});

  /// convert model to Json structure so that you can it to store data in Firesbase
  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "steps": steps,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    //print(json["FullName"]);
    return UserModel(
        fullName: json["FullName"],
        email: json["Email"],
        phoneNo: json["Phone"],
        password: json["Password"],
        steps: json["steps"]

    );
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      fullName: data["FullName"],
      phoneNo: data["Phone"],
      steps: data["steps"]
    );
  }
}
