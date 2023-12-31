// screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/feed/controllers/feedcontroller.dart';

import '../../lostproperty/screens/found_property.dart';
import '../../lostproperty/screens/lost_property.dart';

class FeedScreen extends StatelessWidget {

  final FeedController controller;

  const FeedScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de botones'),
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
              child: const Text("ESTA MIERDA NO FUNCIONA"),
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
          title: const Text('¿Que quieres hacer?'),
          content: const Text('Estas a punto de adentrarte en un mundo de cosas perdidas'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.to(() => const LostProperty());
              },
              child: const Text('Ver cosas encontradas'),
            ),
            TextButton(
              onPressed: () {
                // Acción al presionar el segundo botón del diálogo
                print('Segundo botón presionado');
                Get.to(() => const FoundProperty());
              },
              child: const Text('Ver cosas Buscadas'),
            ),
          ],
        );
      },
    );
  }
}