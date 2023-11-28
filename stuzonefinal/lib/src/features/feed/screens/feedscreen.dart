// screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/feed/controllers/feedcontroller.dart';

import '../../lostproperty/screens/found_property.dart';
import '../../lostproperty/screens/lost_property.dart';

class FeedScreen extends StatelessWidget {

  final FeedController controller;

  FeedScreen({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de botones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => controller.buttonPressed(0),
              child: Text(controller.buttons[0].name),
            ),
            ElevatedButton(
            onPressed: () {
            _mostrarDialogo(context);
            },
              child: Text(controller.buttons[1].name),
            ),
            ElevatedButton(
              onPressed: () => controller.buttonPressed(2),
              child: Text(controller.buttons[2].name),
            ),
            ElevatedButton(
              onPressed: () => controller.buttonPressed(3),
              child: Text(controller.buttons[3].name),
            ),
            ElevatedButton(
              onPressed: () => controller.buttonPressed(4),
              child: Text(controller.buttons[4].name),
            ),
            ElevatedButton(
              onPressed: () {
                _mostrarDialogo(context);
              },
              child: Text("ESTA MIERDA NO FUNCIONA"),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Diálogo con dos botones'),
          content: Text('Este es un diálogo con dos botones.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.to(() => LostProperty());
              },
              child: Text('Ver cosas encontradas'),
            ),
            TextButton(
              onPressed: () {
                // Acción al presionar el segundo botón del diálogo
                print('Segundo botón presionado');
                Get.to(() => FoundProperty());
              },
              child: Text('Ver cosas Buscadas'),
            ),
          ],
        );
      },
    );
  }
}