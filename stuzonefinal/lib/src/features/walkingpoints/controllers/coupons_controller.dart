import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/walkingpoints/models/coupon_model.dart';

import '../../../repository/coupon_repository/coupon_repository.dart';

class CouponController extends GetxController {
  static CouponController get instance => Get.find();

  /// Repositories
  final _couponRepo = CouponRepository.instance;

  /// Get User Email and pass to UserRepository to fetch user record.
  getLostData(String name) {
    try {
      return _couponRepo.getCouponDetails(name);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    }
  }

  /// Fetch List of user records.
  Future<List<Coupon>> getAllCoupons() async => await _couponRepo.allCupones();

  /// Update User Data
  updateRecord(Coupon couponitem) async {
    await _couponRepo.updateCouponRecord(couponitem);
    //Show some message or redirect to other screen here...
  }

  Future<void> deleteCoupon(String title) async {
    if (title.isEmpty) {
      Get.snackbar("Error", "User cannot be deleted.");
    } else {
      await _couponRepo.deleteCoupon(title);
      Get.snackbar("Success", "Account has been deleted.");
      // You can call your redirection to other screen here...
      // OR call the LOGOUT() function.
    }
  }
}