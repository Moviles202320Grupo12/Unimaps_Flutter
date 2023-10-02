import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  String path_image = "lib/imgs/google.png";
  String path_google = "lib/imgs/google.png";
  String path_outlook = "lib/imgs/google.png";
  String path_huella = "lib/imgs/google.png";
  
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
          '¡Hola! Regístrese para comenzar',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ));

    final ingresarUsername = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Nombre de usuario',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final ingresarCorreo = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Correo uniandes',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final ingresarContrasena = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Contraseña',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );
    final confirmarContrasena = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: const TextField(
        obscureText: false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Confirma ontraseña',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );
    final ingresar = Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15, // Margen simétrico para centrar el botón
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
          onPressed: () {},
          child: const Text(
            'Ingresar',
            style: TextStyle(color: Color(0xbbbbf6a700), fontSize: 17),
          ),
        ));

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
        vertical: MediaQuery.of(context).size.width * 0.005,
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

    final crearCuenta = Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.05,
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
                // Acción al tocar el texto
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
          ingresarUsername,
          ingresarCorreo,
          ingresarContrasena,
          confirmarContrasena,
          ingresar,
          otroIngreso,
          metodosIngreso,
          crearCuenta
        ]));
  }
}
