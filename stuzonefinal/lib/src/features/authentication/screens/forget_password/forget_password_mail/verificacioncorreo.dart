import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
//import 'package:app_final/pages/contrasena_creada.dart';

class VerificacionCorreo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final texto = Container(
      margin: EdgeInsets.only(top: 100, left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: const Text(
        'OTP Verificacion',
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
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: const Text(
        'Envia el código de seguridad que recibiste a tu correo',
        style: TextStyle(
            color: Color(0xbbF6A700),
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
    );

    final defaultPinTheme = PinTheme(
        width: 100,
        height: 100,
        textStyle: TextStyle(color: Colors.black, fontSize: 26),
        decoration: BoxDecoration(
            color: Colors.amber.shade400,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.transparent)));

    final codigo_verificacion = Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        width: double.infinity,
        child: Pinput(
          length: 4,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Colors.black),
          )),
        ));
    final boton_verificar = Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60, // Margen simétrico para centrar el botón
        ),
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
          onPressed: () {
            /*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContrasenaCreada()),
            );*/
          },
          child: const Text(
            'Verificar',
            style: TextStyle(color: Colors.amber, fontSize: 17),
          ),
        ));

    final enviar_code = Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width *
            0.1, // Dynamic margin based on screen width
      ),
      height: (MediaQuery.of(context).size.height / 2) - 110,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the children horizontally
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center the children vertically
        children: [
          const Text(
            'No lo recibiste?  ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: InkWell(
              onTap: () {
                // Acción al tocar el texto
              },
              child: const Text(
                'Volver a enviar',
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
          subtexto,
          codigo_verificacion,
          boton_verificar,
          enviar_code
        ]));
  }
}
