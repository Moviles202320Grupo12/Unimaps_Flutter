import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/constants/sizes.dart';
import 'package:stuzonefinal/src/features/authentication/screens/signup/signup_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/animations/fade_in_animation/animation_design.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_model.dart';
import '../login/login_screen.dart';

/*

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animationIn();

    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body: Stack(
          children: [
            TFadeInAnimation(
              isTwoWayAnimation: false,
              durationInMs: 1200,
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
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                        tag: 'welcome-image-tag',
                        child: Image(
                            image: const AssetImage(tWelcomeScreenImage),
                            width: width * 0.5,
                            height: height * 0.4)),
                    Column(
                      children: [
                        Text(tWelcomeTitle,
                            style: Theme.of(context).textTheme.displayMedium),
                        Text(tWelcomeSubTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: Text(tLogin.toUpperCase()),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: Text(tSignup.toUpperCase()),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

class LoginPage extends StatelessWidget {
  // Variables

  // ignore: non_constant_identifier_names
  String path_image = tLogoStuZone;
  String path_google = tGoogleLogoImage;
  String path_outlook = tLogoOutlook;
  String path_huella = tHuella;
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    final texto = Container(
        height: 130,
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          top: 80,
          left: 20,
          right: 20,
        ),
        child: const Text(
          'Que bueno verte de nuevo !',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ));

    final ingresarCorreo = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Ingresa tu correo uniandes',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final ingresarContrasena = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Ingresa tu contraseña',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final olvideContrasena = Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 25, bottom: 25),
        child: InkWell(
          onTap: () {
            /*
            Navigator.push(
                

              context,
              MaterialPageRoute(), //builder: (context) => OlvidoContrasena()),
              
                );
                */
          },
          child: const Text(
            'Olvide mi contraseña',
            style: TextStyle(
              color: Colors.black, // Color del texto
              decoration: TextDecoration.underline,
              // Subrayado
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
    final ingresar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SizedBox(
        width: double.infinity, // Expand the button
        height: 65.0, // Puedes aumentar la altura según sea necesario
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
            // Aquí puedes ajustar el padding si necesitas más espacio interno
          ),
          onPressed: () {
            // Define la funcionalidad del botón aquí
          },
          child: const Text(
            'Ingresar',
            style: TextStyle(
                color: Colors.amber,
                fontSize: 18), // Puedes aumentar el tamaño de la fuente aquí
          ),
        ),
      ),
    );

    final otroIngreso = Container(
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black12,
                thickness: 2,
                height: 36,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(2.0), // Padding around the text
                  color: Colors
                      .white, // Background color matching the main container
                  child: const Text(
                    "  Ingresar con  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));

    final googleButton = InkWell(
      onTap: () {
        // Acción al tocar el texto
      },
      child: Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path_google)),
          borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
          shape: BoxShape.rectangle,
        ),
      ),
    );

    final outlookButton = InkWell(
      onTap: () {
        // Acción al tocar el texto
      },
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path_outlook)),
          borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
          shape: BoxShape.rectangle,
        ),
      ),
    );

    final huella = InkWell(
      onTap: () {
        // Acción al tocar el texto
      },
      child: Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path_huella)),
          borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
          shape: BoxShape.rectangle,
        ),
      ),
    );

    final metodosIngreso = Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.05,
        horizontal: MediaQuery.of(context).size.width *
            0.1, // Dynamic margin based on screen width
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the children horizontally
        children: [googleButton, outlookButton, huella],
      ),
    );

    final crear_cuenta = Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.1,
        horizontal: MediaQuery.of(context).size.width *
            0.1, // Dynamic margin based on screen width
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the children horizontally
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center the children vertically
        children: [
          const Text(
            'No tienes una cuenta?  ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: InkWell(
              onTap: () {
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );*/
              },
              child: const Text(
                'Crear cuenta',
                style: TextStyle(
                  color: Colors.amber, // Color del texto
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  // Subrayado
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          texto,
          ingresarCorreo,
          ingresarContrasena,
          olvideContrasena,
          ingresar,
          otroIngreso,
          metodosIngreso,
          crear_cuenta
        ]));
  }
}
