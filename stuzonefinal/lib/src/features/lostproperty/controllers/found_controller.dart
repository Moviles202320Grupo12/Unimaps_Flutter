import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';

import '../../../repository/lost_repository/found_repository.dart';

class FoundController extends GetxController {
  static FoundController get instance => Get.find();

  /// Repositories
  final _foundRepo = FoundRepository.instance;

  /// Get User Email and pass to UserRepository to fetch user record.
  getFoundData(String name) {
    try {
      return _foundRepo.getFoundDetails(name);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    }
  }

  /// Fetch List of user records.
  Future<List<LostModel>> getAllFounds() async => await _foundRepo.allFounds();

  /// Update User Data
  updateRecord(LostModel founditem) async {
    await _foundRepo.updateFoundRecord(founditem);
    //Show some message or redirect to other screen here...
  }

  Future<void> deleteLost(String name) async {
    if (name.isEmpty) {
      Get.snackbar("Error", "User cannot be deleted.");
    } else {
      await _foundRepo.deleteFound(name);
      Get.snackbar("Success", "Account has been deleted.");
      // You can call your redirection to other screen here...
      // OR call the LOGOUT() function.
    }
  }
}