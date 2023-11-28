import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';


class PruebaDeMierda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guardar y Mostrar Imagen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guardar y Mostrar Imagen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile != null
                ? Image.file(
              _imageFile!,
              height: 200,
            )
                : Text('No hay imagen guardada'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _tomarFoto();
              },
              child: Text('Tomar Foto'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _mostrarFoto();
              },
              child: Text('Mostrar Foto Guardada'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _tomarFoto() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Obtenemos la ruta del directorio de almacenamiento local
      Directory appDir = await getApplicationDocumentsDirectory();
      String appDirPath = appDir.path;

      // Creamos una nueva ruta para guardar la imagen en el directorio de almacenamiento local
      String newImagePath = '$appDirPath/sample_image.jpg';

      // Copiamos la imagen desde XFile a File en la nueva ruta
      File newImage = await File(pickedFile.path).copy(newImagePath);

      setState(() {
        _imageFile = newImage;
      });
    }
  }

  Future<void> _mostrarFoto() async {
    // Mostrar la imagen guardada desde el almacenamiento local
    Directory appDir = await getApplicationDocumentsDirectory();
    String appDirPath = appDir.path;
    String imagePath = '$appDirPath/sample_image.jpg';

    File imageFile = File(imagePath);


    if (await imageFile.exists()) {
      setState(() {
        _imageFile = imageFile;
      });
    } else {
      setState(() {
        _imageFile = null;
      });
    }
  }
}
