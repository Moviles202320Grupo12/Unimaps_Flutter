import 'package:cloud_firestore/cloud_firestore.dart';

class LostTimerModel {
  final String? id;
  final int tiempo;

  /// Constructor
  const LostTimerModel(
      {this.id, required this.tiempo});

  /// convert model to Json structure so that you can it to store data in Firesbase
  toJson() {
    return {
      "tiempo": tiempo,
    };
  }

  /// Map Json oriented document snapshot from Firebase to LostModel
  factory LostTimerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return LostTimerModel(
      id: document.id,
      tiempo: data["tiempo"],
    );
  }
}