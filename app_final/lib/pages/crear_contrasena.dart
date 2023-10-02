import 'package:flutter/material.dart';

class CrearContrasena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final texto = Container(
      margin: EdgeInsets.only(top: 100, left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: const Text(
        'Crear Nueva Contraseña',
        style: TextStyle(
          color: Color(0xFF1E232C),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          height: 0.04,
          letterSpacing: -0.30,
        ),
      ),
    );

    final subtexto = Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: const Text(
        'Tu nueva contraseña debe ser diferente a la anterior.',
        style: TextStyle(
            color: Color(0xbbbbF6A700),
            fontSize: 16,
            fontWeight: FontWeight.w400),
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
            labelText: 'Nueva contraseña',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final confirmarContrasena = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Confirma tu contraseña',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final boton_confirmar = Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        height: 50.0, // Altura del botón
        width: 400.0, // Ancho del botón

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Fondo de color café
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Bordes redondeados
            ),
            // Altura y ancho del botón
          ),
          onPressed: () {},
          child: const Text(
            'Confirmar nueva Contraseña',
            style: TextStyle(color: Colors.amber, fontSize: 17),
          ),
        ));

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          texto,
          subtexto,
          ingresarContrasena,
          confirmarContrasena,
          boton_confirmar
        ]));
  }
}
