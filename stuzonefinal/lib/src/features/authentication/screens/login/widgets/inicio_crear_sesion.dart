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

    final timer = Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppLifecycleReactorState ()),
              );
            },
            child: Image.asset(
              timerimg, 
             width: 40, // Establece el ancho de la imagen
          height: 40, // Establece la altura de la imagen
          fit: BoxFit.contain,
            ),
          ),
        ),
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

    final invitado = Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 110, // Margen horizontal
            vertical: 50),
        height: 50.0, // Altura del texto interactivo
        width: 400.0, // Ancho del texto interactivo
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Map()));
          },
          child: const Text(
            'Continuar como Invitado',
            style: TextStyle(
              color: Colors.black, // Color del texto
              decoration: TextDecoration.underline,
              // Subrayado
            ),
            textAlign: TextAlign.center,
          ),
        ));

    return Material(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [timer, photoImage, ingresar, crearCuenta, invitado ]));
  }
}
