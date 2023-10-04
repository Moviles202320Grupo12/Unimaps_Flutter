import 'package:stuzonefinal/src/features/feed/models/feedmodel.dart';
import 'package:get/get.dart';

import 'package:stuzonefinal/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:stuzonefinal/src/features/walkingpoints/screens/screenwalk.dart';
import 'package:stuzonefinal/src/features/core/screens/map.dart';
import 'package:stuzonefinal/src/features/tutors/screens/select_tutor.dart';
import 'package:stuzonefinal/src/features/events/screens/events.dart';

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
      Get.to(() => Map());
    }else if (index == 1) {
      print('C');
      Get.to(() => LostPropertyHome());
    }  else if (index == 2) {
      print('B');
      Get.to(() => ScreenWalk());
    } else if (index == 3) {
      print('C');
      Get.to(() => Events());
    } else if (index == 4) {
      print('C');
      Get.to(() => SelectTutorPage());
    } else {
      print('D');
    }
  }
}