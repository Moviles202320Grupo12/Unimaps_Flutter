import 'package:flutter/material.dart';

class ContasenaCreada extends StatelessWidget {
  String path_success = "lib/imgs/google.png";

  ///app_final/lib/imgs/google.png
  @override
  Widget build(BuildContext context) {
    final photoImage = Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(top: 80, bottom: 10, left: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path_success)),
        borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [photoImage]),
    );
  }
}
