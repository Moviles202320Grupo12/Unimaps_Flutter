import 'package:flutter/material.dart';

class LostProperty extends StatelessWidget {
  @override // Just for know we are overriding

  // Widget creation
  Widget build(BuildContext context) {
    return MaterialApp(home: LostPropertyHome());
  }
}

class LostPropertyHome extends StatelessWidget {
  // ignore: constant_identifier_names
  static const black_titles = Color(0x00090909);

  const LostPropertyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: (const Text('Objetos Perdidos',
          style: TextStyle(color: Colors.black, fontFamily: 'Urbanist'))),
      backgroundColor: Colors.white,
    ));
  }
}
