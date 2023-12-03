import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stuzonefinal/src/features/authentication/models/user_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Users.db";
  //0000000000000000000000000000000000
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();


  static Future<Database> _getDB() async {
    print("LLEGO HASTASAPOCMOAKMDCOMD");
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            'CREATE TABLE Users ( Email TEXT, FullName TEXT, Password TEXT, Phone TEXT, steps INTEGER);'),
        version: _version);
  }

  static Future<int> addUser(UserModel user) async {
    final db = await _getDB();
    return await db.insert("Users", user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUser(UserModel user) async {
    final db = await _getDB();
    return await db.update("Users", user.toJson(),
        where: 'Email = ?',
        whereArgs: [user.email],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


  static Future<List<UserModel>?> getAllUsers() async {
    final db = await _getDB();


    final List<Map<String, dynamic>> maps = await db.query("Users");
    print("MIREN LO QUE ME SACA ESTA GONORREA");
    print(maps);

    if(maps.isEmpty){
      return null;
    }

    print("AHORA LO QUE ENVIO");
    print(List.generate(maps.length, (index) => UserModel.fromJson(maps[index])));

    return List.generate(maps.length, (index) => UserModel.fromJson(maps[index]));
  }

  static Future<void> actualizarbd(Future<List<UserModel>> popo) async {
    try {
      final List<UserModel> usuarios = await popo;
      final db = await _getDB();

      await db.delete('Users');

      for (var usuario in usuarios) {
        // Aquí puedes acceder a cada usuario individualmente dentro del bucle
        // Por ejemplo, podrías insertar cada usuario en la base de datos local
        await addUser(usuario);
      }
    } catch (e) {
      print("Error al actualizar usuarios en la base de datos local: $e");
      rethrow;
    }


  }
}
