import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DestinationSelectionScreen(),
    );
  }
}

class DestinationSelectionScreen extends StatefulWidget {
  @override
  _DestinationSelectionScreenState createState() => _DestinationSelectionScreenState();
}

class _DestinationSelectionScreenState extends State<DestinationSelectionScreen> {
  String selectedDestination = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Destino'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingrese su destino:',
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  selectedDestination = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Escriba su destino',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes realizar acciones relacionadas con el destino seleccionado.
                // Por ejemplo, puedes abrir un mapa o calcular una ruta.
                print('Destino seleccionado: $selectedDestination');
              },
              child: Text('Confirmar Destino'),
            ),
          ],
        ),
      ),
    );
  }
}