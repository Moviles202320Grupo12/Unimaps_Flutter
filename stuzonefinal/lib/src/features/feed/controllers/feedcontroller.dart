import 'package:stuzonefinal/src/features/core/screens/repo_trabajos.dart';
import 'package:stuzonefinal/src/features/events/screens/todos_los_eventos.dart';
import 'package:stuzonefinal/src/features/feed/models/feedmodel.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/tutors/screens/todos_los_tutores.dart';
import 'package:stuzonefinal/src/features/walkingpoints/screens/screenwalk.dart';
import 'package:stuzonefinal/src/features/core/screens/map.dart';

import 'package:stuzonefinal/src/features/lostproperty/screens/lost_property.dart';

class FeedController {
  final List<ButtonModel> buttons = [
    ButtonModel('MAIN MAP'),
    ButtonModel('LOST PROPERTY'),
    ButtonModel('WALKING POINTS'),
    ButtonModel('EVENT'),
    ButtonModel('TUTORS'),
    ButtonModel('REPOSITORY HOMEWORK'),
  ];

  void buttonPressed(int index) {
    if (index == 0) {
      print('A');
      Get.to(() => Map());
    } else if (index == 1) {
      print('C');
      Get.to(() => LostProperty());
    } else if (index == 2) {
      print('B');
      Get.to(() => const ScreenWalk());
    } else if (index == 3) {
      print('C');

      Get.to(() => AllEvents());
    } else if (index == 4) {
      print('C');
      Get.to(() => AllTutors());
    } else if (index == 5) {
      print('Homework');
      Get.to(() => RepoTrabajos());
    }
  }
}
