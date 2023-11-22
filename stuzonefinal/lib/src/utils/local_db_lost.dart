import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';

import '../features/lostproperty/controllers/lost_controller.dart';

class DataLocalLost {
  static const int _version = 1;
  static const String _dbName = "Lost.db";
  //0000000000000000000000000000000000
  static final DataLocalLost _instance = DataLocalLost._internal();
  factory DataLocalLost() => _instance;

  static Database? _database;

  DataLocalLost._internal();


  static Future<Database> _getDB() async {
    print("LLEGO HASTASAPOCMOAKMDCOMD");
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            'CREATE TABLE Lost ( name TEXT, description TEXT, location TEXT, image TEXT);'),
        version: _version);
  }

  static Future<int> addLost(LostModel lost) async {
    final db = await _getDB();
    return await db.insert("Lost", lost.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateLost(LostModel lost) async {
    final db = await _getDB();
    return await db.update("Lost", lost.toJson(),
        where: 'description = ?',
        whereArgs: [lost.description],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


  static Future<List<LostModel>?> getAllLosts() async {
    final db = await _getDB();


    final List<Map<String, dynamic>> maps = await db.query("Lost");
    print("MIREN LO QUE ME SACA ESTA GONORREA");
    print(maps);

    if(maps.isEmpty){
      return null;
    }

    print("AHORA LO QUE ENVIO");
    print(List.generate(maps.length, (index) => LostModel.fromJson(maps[index])));

    return List.generate(maps.length, (index) => LostModel.fromJson(maps[index]));
  }

  static Future<void> actualizarbd(Future<List<LostModel>> popo) async {
    try {
      final List<LostModel> perdidos = await popo;
      final db = await _getDB();
      final List<Map<String, dynamic>> maps = await db.query("Lost");
      List<LostModel> lalista = List.generate(maps.length, (index) => LostModel.fromJson(maps[index]));
      final controller = Get.put(LostController());
      CollectionReference _reference =
      FirebaseFirestore.instance.collection('lostproperty');
      for (var perdida in lalista){
        Map<String, String> dataToSend = {
          'name': perdida.name,
          'description': perdida.description,
          'location': perdida.location,
          'image': perdida.image,
        };

        _reference.add(dataToSend);
      }


      await db.delete('Lost');


    } catch (e) {
      print("Error al actualizar usuarios en la base de datos local: $e");
      throw e;
    }


  }
}
