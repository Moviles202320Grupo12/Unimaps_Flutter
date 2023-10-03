import 'package:flutter/material.dart';

class SpecificEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SpecificEventHome());
  }
}

class SpecificEventHome extends StatelessWidget {
  const SpecificEventHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context,
                '/pages/events.dart'); // Navegar a una ventana específica
          },
        ),
        centerTitle: true,
        title: const Text(
          'Eventos',
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
                      width: 360, // Ancho de la imagen
                      height: 200, // Altura de la imagen
                      child: Image.asset(
                        'lib/imgs/fopre.png',
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
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Fopre",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Fopre 2023, prepárate, Del 5 al 9 de septiembre en el campus de Uniandes.",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xBBBB87400),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
