import 'package:flutter/material.dart';

class LostProperty extends StatelessWidget {
  @override // Just for know we are overriding

  // Widget creation
  Widget build(BuildContext context) {
    return MaterialApp(home: LostPropertyHome());
  }
}

class LostPropertyHome extends StatelessWidget {
  @override
  static const black_titles = Color(0x090909);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: (const Text('Objetos Perdidos',
              style: TextStyle(color: Colors.black))),
          backgroundColor: Colors.white),
    );
  }
}
