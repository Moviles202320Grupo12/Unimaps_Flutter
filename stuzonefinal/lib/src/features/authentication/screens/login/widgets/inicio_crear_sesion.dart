import 'package:stuzonefinal/src/constants/image_strings.dart';
import 'package:stuzonefinal/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:stuzonefinal/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/features/core/screens/map.dart';
import 'package:stuzonefinal/src/features/authentication/screens/login/widgets/BQ4.dart';
class InicioCrearSesion extends StatelessWidget {
  // Variables

  String path_image = tLogoStuZone;
  String timerimg = timer;

  InicioCrearSesion({super.key});

  @override
  Widget build(BuildContext context) {
    final ingresar = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB87400), // Fondo de color café
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Bordes redondeados
              ),
              padding: const EdgeInsets.only(
                  left: 80, right: 80, bottom: 10, top: 10)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Text(
            'Ingresar',
            style: TextStyle(fontSize: 20, color: Colors.white), // Texto blanco
          ),
        ),
      ),
    );

    final photoImage = Container(
      width: 340,
      height: 340,
      margin: const EdgeInsets.only(top: 80, bottom: 10, left: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path_image)),
        borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
      ),
    );


    final crearCuenta = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.only(
                    left: 70, right: 70, bottom: 10, top: 10)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
            child: const Text(
              'Crear cuenta',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );


    return Material(
        child: Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ photoImage, ingresar, crearCuenta])));
  }
}
