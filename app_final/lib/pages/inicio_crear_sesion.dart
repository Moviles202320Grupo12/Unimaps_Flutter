import 'package:app_final/pages/registro.dart';
import 'package:flutter/material.dart';
import 'package:app_final/pages/login_page.dart';

class InicioCrearSesion extends StatelessWidget {
  // Variables

  String path_image = "lib/imgs/el_logo.png";

  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text('Ingresar'),
        ));

    final photoImage = Container(
      width: 340,
      height: 340,
      margin: const EdgeInsets.only(top: 80, bottom: 10, left: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path_image)),
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
              MaterialPageRoute(builder: (context) => RegisterPage()),
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

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [photoImage, ingresar, crear_cuenta, invitado]);
  }
}
