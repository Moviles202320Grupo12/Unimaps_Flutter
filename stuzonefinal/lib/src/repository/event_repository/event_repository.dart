import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/events/models/event_model.dart';
import '../authentication_repository/exceptions/t_exceptions.dart';

class EventRepository extends GetxController {
  static EventRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user data
  Future<void> createEvent(EventModel event) async {
    try {
      await recordExist(event.nombre) ? throw "Record Already Exists" : await _db.collection("events").add(event.toJson());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  /// Fetch User Specific details
  Future<EventModel> getEventDetails(String nombre) async {
    try {
      final snapshot = await _db.collection("events").where("nombre", isEqualTo: nombre).get();
      if (snapshot.docs.isEmpty) throw 'No such item found';
      final eventData = snapshot.docs.map((e) => EventModel.fromSnapshot(e)).single;
      return eventData;
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
  Future<List<EventModel>> allEvents() async {
    try {
      final snapshot = await _db.collection("events").get();
      final events = snapshot.docs.map((e) => EventModel.fromSnapshot(e)).toList();
      return events;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      print (e);
      throw 'Something went wrong. Please Try AgainAAAAAAAAAAAAAA';
    }
  }

  Future<List<EventModel>> allEventsSorted() async {
    try {
      final snapshot = await _db.collection("events").get();
      final events = snapshot.docs.map((e) => EventModel.fromSnapshot(e)).toList();
      events.sort((a, b) => b.consultas.compareTo(a.consultas));
      return events;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      print (e);
      throw 'Something went wrong. Please Try AgainAAAAAAAAAAAAAA';
    }
  }

  /// Update User details
  Future<void> updateEventRecord(EventModel item) async {
    try {
      await _db.collection("events").doc(item.id).update(item.toJson());
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
  Future<void> deleteEvent(String id) async {
    try {
      await _db.collection("events").doc(id).delete();
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
  Future<bool> recordExist(String nombre) async {
    try {
      final snapshot = await _db.collection("events").where("nombre", isEqualTo: nombre).get();
      return snapshot.docs.isEmpty ? false : true;
    } catch (e) {
      throw "Error fetching record.";
    }
  }
}
