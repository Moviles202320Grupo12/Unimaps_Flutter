import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import 'package:stuzonefinal/src/repository/authentication_repository/authentication_repository.dart';
import 'package:stuzonefinal/src/repository/lost_repository/time_reg_lostpropRepo.dart';

import '../models/time_register_model.dart';

class LostTimerController extends GetxController {
  static LostTimerController get instance => Get.find();

  /// Repositories
  final _lostTimerRepo = LostTimerRepository.instance;

  /// Get User Email and pass to UserRepository to fetch user record.
  getLostData(String id) {
    try {
      return _lostTimerRepo.getLostTimerDetails(id);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    }
  }

  /// Fetch List of user records.
  Future<List<LostTimerModel>> getAllLostTimers() async => await _lostTimerRepo.allLostTimers();

  /// Update User Data
  updateRecord(LostTimerModel lostTimeritem) async {
    await _lostTimerRepo.updateLostTimerRecord(lostTimeritem);
    //Show some message or redirect to other screen here...
  }

  Future<void> deleteLost(String id) async {
    if (id.isEmpty) {
      Get.snackbar("Error", "User cannot be deleted.");
    } else {
      await _lostTimerRepo.deleteLostTimer(id);
      Get.snackbar("Success", "Account has been deleted.");
      // You can call your redirection to other screen here...
      // OR call the LOGOUT() function.
    }
  }
}