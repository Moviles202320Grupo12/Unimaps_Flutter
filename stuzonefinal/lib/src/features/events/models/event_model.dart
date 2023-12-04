import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String? id;
  final String nombre;
  final String lugar;
  final String fecha;
  final String categoria;
  final String activo;
  final String image;
  final int consultas;

  /// Constructor
  const EventModel(
      {this.id, required this.nombre, required this.lugar, required this.fecha, required this.categoria, required this.activo, required this.image, required this.consultas});

  /// convert model to Json structure so that you can it to store data in Firesbase
  toJson() {
    return {
      "nombre": nombre,
      "lugar": lugar,
      "fecha": fecha,
      "categoria": categoria,
      "activo": activo,
      "image" : image,
      "consultas": consultas
    };
  }

  /// Map Json oriented document snapshot from Firebase to LostModel
  factory EventModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    print(data);
    return EventModel(
      id: document.id,
      nombre: data["nombre"],
      lugar: data["lugar"],
      fecha: data["fecha"],
      categoria: data["categoria"],
      activo: data["activo"],
      image: data["image"],
      consultas: data["consultas"] as int
    );
  }
}