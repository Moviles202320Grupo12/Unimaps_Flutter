import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import 'package:stuzonefinal/src/repository/authentication_repository/authentication_repository.dart';
import 'package:stuzonefinal/src/repository/lost_repository/lost_repository.dart';

class LostController extends GetxController {
  static LostController get instance => Get.find();

  /// Repositories
  final _lostRepo = LostRepository.instance;

  /// Get User Email and pass to UserRepository to fetch user record.
  getLostData(String name) {
    try {
      return _lostRepo.getLostDetails(name);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    }
  }

  /// Fetch List of user records.
  Future<List<LostModel>> getAllLosts() async => await _lostRepo.allLosts();

  /// Update User Data
  updateRecord(LostModel lostitem) async {
    await _lostRepo.updateLostRecord(lostitem);
    //Show some message or redirect to other screen here...
  }

  Future<void> deleteLost(String name) async {
    if (name.isEmpty) {
      Get.snackbar("Error", "User cannot be deleted.");
    } else {
      await _lostRepo.deleteLost(name);
      Get.snackbar("Success", "Account has been deleted.");
      // You can call your redirection to other screen here...
      // OR call the LOGOUT() function.
    }
  }
}