import 'package:flutter/material.dart';

class FindLostProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FindLostPropertyHome());
  }
}

class FindLostPropertyHome extends StatelessWidget {
  const FindLostPropertyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Objetos Perdidos',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                      width: 380, // Ancho de la imagen
                      height: 200, // Altura de la imagen
                      child: Image.asset(
                        'lib/imgs/el_logo.png', // Reemplaza con la ruta de tu imagen
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add your share logic here
                      },
                      child: Icon(Icons.share),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Iphone 13",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Descripcion",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xBBBB87400),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Un parrafo con una descripcion.Un parrafo con una descripcion.Un parrafo con una descripcion.Un parrafo con una descripcion.Un parrafo con una descripcion.Un parrafo con una descripcion.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black, minimumSize: Size(40, 40)),
                    child: const Text(
                      "Es mio",
                      style: TextStyle(
                          color: Color(0xFFF6A700),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ))),
          ),
        ],
      ),
    );
  }
}
