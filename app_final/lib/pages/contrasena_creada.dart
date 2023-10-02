import 'package:flutter/material.dart';

class ContasenaCreada extends StatelessWidget {
  String path_success = "lib/imgs/Successmark.png";

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final photoImage = Container(
      width: 100, // Ancho fijo para el ejemplo
      height: 100, // Alto fijo para el ejemplo
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path_success),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(60),
      ),
    );

    final texto = Positioned(
      left: 0,
      right: 0,
      top: 65,
      bottom: 0,
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.42),
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(2.0), // Padding around the text
            color: Colors.white, // Background color matching the main container
            child: const Text(
              "Contraseña Cambiada!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(2.0), // Padding around the text
            color: Colors.white, // Background color matching the main container
            child: const Text(
              "Tu contraseña ha sido cambiada satisfactoriamente",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15, // Margen simétrico para centrar el botón
            ),
            height: 50.0, // Altura del botón
            width: 300.0, // Ancho del botón

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
                style: TextStyle(color: Colors.amber, fontSize: 17),
              ),
            ))
      ]),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            texto,
            Positioned(
              top: screenHeight *
                  0.35, // Posiciona el borde superior en la mitad de la altura de la pantalla
              left: 0,
              right: 0,
              child: Center(child: photoImage),
            ),
          ],
        ));
  }
}
