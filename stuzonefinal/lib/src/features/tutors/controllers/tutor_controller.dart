import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/tutors/models/tutor_model.dart';
import 'package:stuzonefinal/src/repository/tutor_repository/tutor_repository.dart';

class TutorController extends GetxController {
  static TutorController get instance => Get.find();

  /// Repositories
  final _tutorsRepo = TutorRepository.instance;

  /// Get User Email and pass to UserRepository to fetch user record.
  getTutorData(String email) {
    try {
      return _tutorsRepo.getTutorDetails(email);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3));
    }
  }

  /// Fetch List of user records.
  Future<List<TutorModel>> getAllTutors() async =>
      await _tutorsRepo.allTutors();

  /// Update User Data
  updateRecord(TutorModel tutoritem) async {
    await _tutorsRepo.updateTutorRecord(tutoritem);
    //Show some message or redirect to other screen here...
  }

  Future<void> deleteTutor(String id) async {
    if (id.isEmpty) {
      Get.snackbar("Error", "User cannot be deleted.");
    } else {
      await _tutorsRepo.deleteTutor(id);
      Get.snackbar("Success", "Account has been deleted.");
      // You can call your redirection to other screen here...
      // OR call the LOGOUT() function.
    }
  }
}
