import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/events/models/event_model.dart';
import 'package:stuzonefinal/src/repository/event_repository/event_repository.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find();

  /// Repositories
  final _eventsRepo = EventRepository.instance;

  /// Get User Email and pass to UserRepository to fetch user record.
  getEventData(String nombre) {
    try {
      return _eventsRepo.getEventDetails(nombre);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 3));
    }
  }

  /// Fetch List of user records.
  Future<List<EventModel>> getAllEvents() async => await _eventsRepo.allEvents();
  Future<List<EventModel>> getAllEventsSorted() async => await _eventsRepo.allEventsSorted();


  /// Update User Data
  updateRecord(EventModel eventitem) async {
    await _eventsRepo.updateEventRecord(eventitem);
    //Show some message or redirect to other screen here...
  }

  Future<void> deleteEvent(String id) async {
    if (id.isEmpty) {
      Get.snackbar("Error", "User cannot be deleted.");
    } else {
      await _eventsRepo.deleteEvent(id);
      Get.snackbar("Success", "Account has been deleted.");
      // You can call your redirection to other screen here...
      // OR call the LOGOUT() function.
    }
  }
}