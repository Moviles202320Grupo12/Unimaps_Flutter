import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import '../../features/walkingpoints/models/coupon_model.dart';
import '../authentication_repository/exceptions/t_exceptions.dart';

class CouponRepository extends GetxController {
  static CouponRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user data
  Future<void> createCoupon(Coupon cupon) async {
    try {
      await recordExist(cupon.description) ? throw "Record Already Exists" : await _db.collection("cupones").add(cupon.toJson());
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
  Future<Coupon> getCouponDetails(String title) async {
    try {
      final snapshot = await _db.collection("cupones").where("title", isEqualTo: title).get();
      if (snapshot.docs.isEmpty) throw 'No such item found';
      final couponData = snapshot.docs.map((e) => Coupon.fromSnapshot(e)).single;
      return couponData;
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
  Future<List<Coupon>> allCupones() async {
    try {
      final snapshot = await _db.collection("cupones").get();
      final cupones = snapshot.docs.map((e) => Coupon.fromSnapshot(e)).toList();
      return cupones;
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
  Future<void> updateCouponRecord(Coupon item) async {
    try {
      await _db.collection("cupones").doc(item.id).update(item.toJson());
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
  Future<void> deleteCoupon(String name) async {
    try {
      await _db.collection("cupones").doc(name).delete();
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
  Future<bool> recordExist(String title) async {
    try {
      final snapshot = await _db.collection("cupones").where("title", isEqualTo: title).get();
      return snapshot.docs.isEmpty ? false : true;
    } catch (e) {
      throw "Error fetching record.";
    }
  }
}