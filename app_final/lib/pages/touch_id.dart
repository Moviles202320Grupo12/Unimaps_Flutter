import 'package:flutter/material.dart';
import 'package:stuzone/registro.dart';
import 'package:stuzone/login_page.dart';

class TouchID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final texto = Container(
        height: 80,
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: const Text(
          'Ingresar con touch ID',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ));

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
    return MaterialApp(
        color: Colors.white,
        home: Scaffold(
            body: Column(children: [texto, ingresar, crear_cuenta, invitado])));
  }
}
