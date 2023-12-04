import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/tutors/models/tutor_model.dart';
import '../authentication_repository/exceptions/t_exceptions.dart';

class TutorRepository extends GetxController {
  static TutorRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user data
  Future<void> createTutor(TutorModel tutor) async {
    try {
      await recordExist(tutor.email) ? throw "Record Already Exists" : await _db.collection("tutors").add(tutor.toJson());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  /// Fetch User Specific details
  Future<TutorModel> getTutorDetails(String email) async {
    try {
      final snapshot = await _db.collection("tutor").where("email", isEqualTo: email).get();
      if (snapshot.docs.isEmpty) throw 'No such item found';
      final tutorData = snapshot.docs.map((e) => TutorModel.fromSnapshot(e)).single;
      return tutorData;
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
  Future<List<TutorModel>> allTutors() async {
    try {
      final snapshot = await _db.collection("tutors").get();
      final tutors = snapshot.docs.map((e) => TutorModel.fromSnapshot(e)).toList();
      return tutors;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (_) {
      throw 'Something went wrong. Please Try Again';
    }
  }

  Future<List<TutorModel>> allTutorSorted() async {
    try {
      final snapshot = await _db.collection("tutors").get();
      final tutors = snapshot.docs.map((e) => TutorModel.fromSnapshot(e)).toList();
      tutors.sort((a, b) => b.llamadas.compareTo(a.llamadas));
      return tutors;
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
  Future<void> updateTutorRecord(TutorModel item) async {
    try {
      await _db.collection("tutors").doc(item.id).update(item.toJson());
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
  Future<void> deleteTutor(String id) async {
    try {
      await _db.collection("tutors").doc(id).delete();
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
  Future<bool> recordExist(String email) async {
    try {
      final snapshot = await _db.collection("tutors").where("email", isEqualTo: email).get();
      return snapshot.docs.isEmpty ? false : true;
    } catch (e) {
      throw "Error fetching record.";
    }
  }
}
