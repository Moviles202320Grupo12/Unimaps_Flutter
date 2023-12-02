import 'package:flutter/material.dart';

class CreateLostProperty extends StatelessWidget {
  const CreateLostProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CreateLostPropertyHome());
  }
}

class CreateLostPropertyHome extends StatelessWidget {
  const CreateLostPropertyHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context,
                '/pages/lost_property.dart'); // Navegar a una ventana específica
          },
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cuadro centrado para ingresar imagen
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                // Botón para agregar imagen
                child: IconButton(
                  icon: const Icon(
                    Icons.add_a_photo,
                    color: Color(0xbbbb87400),
                  ),
                  onPressed: () {
                    // Implement your image picker logic here
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Espacio para texto "Qué encontraste"
            const TextField(
              decoration: InputDecoration(
                labelText: "¿Qué encontraste",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Espacio para texto "Donde lo encontraste"
            const TextField(
              decoration: InputDecoration(
                labelText: "Donde lo encontraste",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Espacio para texto "Cuando lo encontraste"
            const TextField(
              decoration: InputDecoration(
                labelText: "Cuando lo encontraste",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Espacio para texto "Descripción"
            const TextField(
              decoration: InputDecoration(
                labelText: "Descripción",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Botón para publicar
            ElevatedButton(
              onPressed: () {
                // Implement your publish logic here
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, minimumSize: const Size(50, 50)),
              child: const Text("Publicar",
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
