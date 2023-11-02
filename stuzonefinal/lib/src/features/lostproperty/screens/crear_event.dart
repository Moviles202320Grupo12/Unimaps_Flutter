import 'package:flutter/material.dart';

class CrearEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CrearEventHome());
  }
}

class CrearEventHome extends StatelessWidget {
  const CrearEventHome({super.key});
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
                '/pages/events.dart');
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Color(0XBBBB87400),
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre del evento:",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Categoría del evento:",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Lugar del evento:",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Fecha del evento:",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Botón para publicar
            ElevatedButton(
              onPressed: () {
                // Implement your publish logic here
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: Size(50, 50)),
              child: Text("Crear",
                  style: TextStyle(
                      color: Color(0xFFF6A700),
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
