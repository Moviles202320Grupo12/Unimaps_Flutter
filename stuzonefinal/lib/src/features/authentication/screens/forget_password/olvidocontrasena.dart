import 'package:stuzonefinal/src/features/authentication/screens/forget_password/forget_password_mail/verificacioncorreo.dart';
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/features/authentication/screens/login/widgets/inicio_crear_sesion.dart';

class OlvidoContrasena extends StatelessWidget {
  const OlvidoContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    final texto = Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
        ),
        child: const Column(children: [
          Text(
            'Olvidaste la clave?',
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          Padding(
              padding:
                  EdgeInsets.only(top: 20), //apply padding to all four sides
              child: Text(
                'No te preocupes. Por favor ingresa tu correo electronico para recuperar tu cuenta',
                style: TextStyle(
                    color: Color(0xbbbbbbf6a700),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )),
        ]));

    final ingresarCorreo = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Ingresa tu correo',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final sendCode = Container(
        margin: const EdgeInsets.only(top: 30),
        height: 45.0, // Altura del botón
        width: 200.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87, // Fondo de color café
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Bordes redondeados
            ),
            // Altura y ancho del botón
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VerificacionCorreo()),
            );
          },
          child: const Text('Ingresar'),
        ));

    final contrasenaConocida = Container(
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
            'Te acuerdas de la contraseña?  ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerificacionCorreo()),
                );
              },
              child: const Text(
                'Ingresar ',
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
          sendCode,
        ]));
  }
}
