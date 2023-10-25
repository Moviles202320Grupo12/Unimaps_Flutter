import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/constants/sizes.dart';
import 'package:stuzonefinal/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:stuzonefinal/src/features/core/screens/map.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/animations/fade_in_animation/animation_design.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_model.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variables

    var mediaQuery = MediaQuery.of(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    // Otros widgets
    final ingresar = Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 15, // Margen simétrico para centrar el botón
        ),
        height: 45.0, // Altura del botón
        width: 200.0, // Ancho del botón

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xbbbbbb87400), // Fondo de color café
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Bordes redondeados
            ),
            // Altura y ancho del botón
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          },
          child: const Text('Ingresar'),
        ));

    final photoImage = Container(
      width: width - 50,
      height: (height / 2) - 150,
      margin: const EdgeInsets.only(top: 80, bottom: 10, left: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(tWelcomeScreenImage)),
        borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
      ),
    );

    final crear_cuenta = Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 10, // Margen simétrico para centrar el botón
        ),
        height: 45.0, // Altura del botón
        width: 200.0, // Ancho del botón
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // ignore: use_full_hex_values_for_flutter_colors
            backgroundColor: Colors.black, // Fondo de color café
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Bordes redondeados
            ),
            // Altura y ancho del botón
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          },
          child: const Text('Crear cuenta'),
        ));

    final invitado = Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 110, // Margen horizontal
            vertical: 50),
        height: 100.0, // Altura del texto interactivo
        width: 400.0, // Ancho del texto interactivo
        child: InkWell(
          onTap: () {
            // Acción al tocar el texto
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

    final controller = Get.put(FadeInAnimationController());
    controller.animationIn();

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tWhiteColor,
        body: Stack(
          children: [
            TFadeInAnimation(
                isTwoWayAnimation: false,
                durationInMs: 1000,
                animate: TAnimatePosition(
                  bottomAfter: 0,
                  bottomBefore: -100,
                  leftBefore: 0,
                  leftAfter: 0,
                  topAfter: 0,
                  topBefore: 0,
                  rightAfter: 0,
                  rightBefore: 0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [photoImage, ingresar, crear_cuenta, invitado])),
          ],
        ),
      ),
    );
  }
}
