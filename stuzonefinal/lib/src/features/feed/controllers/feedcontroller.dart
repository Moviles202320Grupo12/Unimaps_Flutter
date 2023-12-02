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
  ];

  void buttonPressed(int index) {
    // Aquí puedes definir la lógica para cada botón según su índice.

    if (index == 0) {
      print('A');
      Get.to(() => const Map());
    }else if (index == 1) {
      print('C');
      Get.to(() => const LostProperty());
    }  else if (index == 2) {
      print('B');
      Get.to(() => const ScreenWalk());
    } else if (index == 3) {
      print('C');
      Get.to(() => AllEvents());
    } else if (index == 4) {
      print('C');
      Get.to(() => AllTutors());
    } else {
      print('D');
    }
  }
}