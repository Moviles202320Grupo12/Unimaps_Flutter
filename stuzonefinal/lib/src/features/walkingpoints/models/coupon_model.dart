import 'package:cloud_firestore/cloud_firestore.dart';

class Coupon {
  final String? id;
  final String title;
  final String description;
  final String imageQr;
  final int pasosNecesarios;
  final int reclamados;

  Coupon({this.id, required this.title, required this.description, required this.imageQr, required this.pasosNecesarios, required this.reclamados});

  toJson() {
    return {
      "title": title,
      "description": description,
      "imageQr": imageQr,
      "pasosNecesarios": pasosNecesarios,
      "reclamados": reclamados
    };
  }

  /// Map Json oriented document snapshot from Firebase to LostModel
  factory Coupon.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Coupon(
        id: document.id,
      title: data["title"],
      description: data["description"],
      imageQr: data["imageQr"],
      pasosNecesarios: data["pasosNecesarios"],
      reclamados: data["reclamados"]
    );
  }
}
