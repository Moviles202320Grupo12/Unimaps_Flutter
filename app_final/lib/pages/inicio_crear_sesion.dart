import 'package:flutter/material.dart';

class InicioCrearSesion extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String path_image = "lib/imgs/el_logo.png";
  @override
  Widget build(BuildContext context) {
    final ingresar = Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 20, // Margen simétrico para centrar el botón
        ),
        height: 35.0, // Altura del botón
        width: 200.0, // Ancho del botón
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // ignore: use_full_hex_values_for_flutter_colors
            backgroundColor: const Color(0xbbbbbb87400), // Fondo de color café
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Bordes redondeados
            ),
            // Altura y ancho del botón
          ),
          onPressed: () {},
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
          vertical: 20, // Margen simétrico para centrar el botón
        ),
        height: 35.0, // Altura del botón
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
          onPressed: () {},
          child: const Text('Crear cuenta'),
        ));

    final invitado = Container(
        margin: EdgeInsets.symmetric(
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
