import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/time_register_model.dart';
import '../authentication_repository/exceptions/t_exceptions.dart';

class LostTimerRepository extends GetxController {
  static LostTimerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user data
  Future<void> createLostTimer(LostTimerModel lost) async {
    try {
      await _db.collection("timeRegLosts").add(lost.toJson());
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  /// SI ESTE PONE PROBLEMAS LO BORRO
  Future<LostTimerModel> getLostTimerDetails(String id) async {
    try {
      final snapshot = await _db.collection("timeRegLosts").where("id", isEqualTo: id).get();
      if (snapshot.docs.isEmpty) throw 'No such item found';
      final lostData = snapshot.docs.map((e) => LostTimerModel.fromSnapshot(e)).single;
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
  Future<List<LostTimerModel>> allLostTimers() async {
    try {
      final snapshot = await _db.collection("timeRegLosts").get();
      final losts = snapshot.docs.map((e) => LostTimerModel.fromSnapshot(e)).toList();
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
  Future<void> updateLostTimerRecord(LostTimerModel item) async {
    try {
      await _db.collection("timeRegLosts").doc(item.id).update(item.toJson());
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
  Future<void> deleteLostTimer(String id) async {
    try {
      await _db.collection("timeRegLosts").doc(id).delete();
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
  Future<bool> recordExist(String id) async {
    try {
      final snapshot = await _db.collection("timeRegLosts").where("id", isEqualTo: id).get();
      return snapshot.docs.isEmpty ? false : true;
    } catch (e) {
      throw "Error fetching record.";
    }
  }
}
