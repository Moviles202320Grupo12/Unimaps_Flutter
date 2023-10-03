// screen.dart
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/features/feed/controllers/feedcontroller.dart';

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
              onPressed: () => controller.buttonPressed(1),
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
              onPressed: () => controller.buttonPressed(5),
              child: Text(controller.buttons[5].name),
            ),
          ],
        ),
      ),
    );
  }
}

