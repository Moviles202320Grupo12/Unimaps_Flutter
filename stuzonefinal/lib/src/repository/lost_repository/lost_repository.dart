import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import '../authentication_repository/exceptions/t_exceptions.dart';

class LostRepository extends GetxController {
  static LostRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user data
  Future<void> createLost(LostModel lost) async {
    try {
      await recordExist(lost.description) ? throw "Record Already Exists" : await _db.collection("lostproperty").add(lost.toJson());
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  /// Fetch User Specific details
  Future<LostModel> getLostDetails(String name) async {
    try {
      final snapshot = await _db.collection("lostproperty").where("name", isEqualTo: name).get();
      if (snapshot.docs.isEmpty) throw 'No such item found';
      final lostData = snapshot.docs.map((e) => LostModel.fromSnapshot(e)).single;
      return lostData;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  /// Fetch All Users
  Future<List<LostModel>> allLosts() async {
    try {
      final snapshot = await _db.collection("lostproperty").get();
      final losts = snapshot.docs.map((e) => LostModel.fromSnapshot(e)).toList();
      return losts;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (_) {
      throw 'Something went wrong. Please Try Again';
    }
  }

  /// Update User details
  Future<void> updateLostRecord(LostModel item) async {
    try {
      await _db.collection("lostproperty").doc(item.name).update(item.toJson());
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (_) {
      throw 'Something went wrong. Please Try Again';
    }
  }

  /// Delete Item Data
  Future<void> deleteLost(String name) async {
    try {
      await _db.collection("lostproperty").doc(name).delete();
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (_) {
      throw 'Something went wrong. Please Try Again';
    }
  }

  /// Check if user exists with email or phoneNo
  Future<bool> recordExist(String name) async {
    try {
      final snapshot = await _db.collection("lostproperty").where("name", isEqualTo: name).get();
      return snapshot.docs.isEmpty ? false : true;
    } catch (e) {
      throw "Error fetching record.";
    }
  }
}
