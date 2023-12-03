import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';

import '../features/lostproperty/controllers/found_controller.dart';


class DataLocalFound {
  static const int _version = 1;
  static const String _dbName = "Found.db";
  //0000000000000000000000000000000000
  static final DataLocalFound _instance = DataLocalFound._internal();
  factory DataLocalFound() => _instance;

  static Database? _database;

  DataLocalFound._internal();


  static Future<Database> _getDB() async {
    print("esto es _getDB");
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            'CREATE TABLE Found ( name TEXT, description TEXT, location TEXT, image TEXT);'),
        version: _version);
  }

  static Future<int> addFound(LostModel lost) async {
    final db = await _getDB();
    return await db.insert("Found", lost.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateFound(LostModel lost) async {
    final db = await _getDB();
    return await db.update("Found", lost.toJson(),
        where: 'description = ?',
        whereArgs: [lost.description],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


  static Future<List<LostModel>?> getAllFounds() async {
    final db = await _getDB();


    final List<Map<String, dynamic>> maps = await db.query("Found");
    print("estoy en el getAll despues de trar la lista");
    print(maps);

    if(maps.isEmpty){
      return null;
    }

    print("Ahora lo que tengo en la lista generada");
    print(List.generate(maps.length, (index) => LostModel.fromJson(maps[index])));

    return List.generate(maps.length, (index) => LostModel.fromJson(maps[index]));
  }

  static Future<void> actualizarbd(Future<List<LostModel>> popo) async {

    print("creo que nunca entra");
    try {
      final List<LostModel> perdidos = await popo;
      final db = await _getDB();
      final List<Map<String, dynamic>> maps = await db.query("Found");
      List<LostModel> lalista = List.generate(maps.length, (index) => LostModel.fromJson(maps[index]));
      final controller = Get.put(FoundController());
      CollectionReference reference =
      FirebaseFirestore.instance.collection('foundproperty');
      for (var perdida in lalista){

        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages =
        referenceRoot.child('lostImages');

        Directory appDir = await getApplicationDocumentsDirectory();
        String appDirPath = appDir.path;
        String imagePath = perdida.image;

        File imageFile = File(imagePath);

        String uniqueFileName =
        DateTime.now().millisecondsSinceEpoch.toString();

        String imageUrl = '';


        //Create a reference for the image to be stored
        Reference referenceImageToUpload =
        referenceDirImages.child(uniqueFileName);

        //Handle errors/success
        try {
          //Store the file
          await referenceImageToUpload.putFile(File(imageFile.path));
          //Success: get the download URL
          imageUrl = await referenceImageToUpload.getDownloadURL();
        } catch (error) {
          //Some error occurred
        }
        Map<String, String> dataToSend = {
          'name': perdida.name,
          'description': perdida.description,
          'location': perdida.location,
          'image': imageUrl,
        };

        reference.add(dataToSend);
      }


      db.delete('Found');


    } catch (e) {
      print("Error al actualizar usuarios en la base de datos local: $e");
      rethrow;
    }


  }
}