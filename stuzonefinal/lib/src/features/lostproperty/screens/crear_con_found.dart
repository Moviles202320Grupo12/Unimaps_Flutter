import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/time_register_model.dart';
import 'package:stuzonefinal/src/repository/lost_repository/time_reg_lostpropRepo.dart';

import 'package:connectivity/connectivity.dart';
import 'package:stuzonefinal/src/utils/local_db_found.dart';
class AddItemFound extends StatefulWidget {
  const AddItemFound({Key? key}) : super(key: key);

  @override
  State<AddItemFound> createState() => _AddItemFoundState();
}

class _AddItemFoundState extends State<AddItemFound> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();

  File? _imageFile;

  late ConnectivityResult _connectionStatus;

  GlobalKey<FormState> key = GlobalKey();
  bool _isConnected = true;

  final CollectionReference _reference =
  FirebaseFirestore.instance.collection('foundproperty');

  String imageUrl = '';
  String newImagePath = '';
  final now = DateTime.now();


  @override
  void initState() {
    super.initState();
    // Suscripción a los cambios de conectividad
    print("A VER QUE PUTAS");
    print(DataLocalFound.getAllFounds());
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              Text(
                'Fecha y Hora Actual: $now',
                style: const TextStyle(fontSize: 24),),
              TextFormField(
                controller: _controllerName,
                decoration:
                const InputDecoration(hintText: 'Enter the name of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerDescription,
                decoration:
                const InputDecoration(hintText: 'Enter the description of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item description';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerLocation,
                decoration:
                const InputDecoration(hintText: 'Enter the location of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item location';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () async {
                    /*
                * Step 1. Pick/Capture an image   (image_picker)
                * Step 2. Upload the image to Firebase storage
                * Step 3. Get the URL of the uploaded image
                * Step 4. Store the image URL inside the corresponding
                *         document of the database.
                * Step 5. Display the image on the list
                *
                * */

                    /*Step 1:Pick image*/
                    //Install image_picker
                    //Import the corresponding library

                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                    await imagePicker.pickImage(source: ImageSource.camera);
                    print('${file?.path}');

                    print(" llego a tomar la fotico");

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();

                    /*Step 2: Upload to Firebase storage*/
                    //Install firebase_storage
                    //Import the library

                    //Get a reference to storage root


                    if (_isConnected==false || _connectionStatus == ConnectivityResult.none){
                      Directory appDir = await getApplicationDocumentsDirectory();
                      String appDirPath = appDir.path;
                      print("ENTRE DONDE ERA");


                      // Creamos una nueva ruta para guardar la imagen en el directorio de almacenamiento local
                      newImagePath = '$appDirPath/$uniqueFileName.jpg';

                      // Copiamos la imagen en la nueva ruta
                      File newImage = await File(file.path).copy(newImagePath);

                    }
                    else{
                      print("DONDE MIERDAS ESTA ENTRANDO");
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                      referenceRoot.child('lostImages');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);

                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file.path));
                        //Success: get the download URL
                        imageUrl = await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        //Some error occurred
                      }

                    }

                  },
                  icon: const Icon(Icons.camera_alt)),
              Visibility(
                  visible: _isConnected == true,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (imageUrl.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Please wait 5 secs and try again')));

                          return;
                        }

                        if (key.currentState!.validate()) {
                          String itemName = _controllerName.text;
                          String itemLocation = _controllerLocation.text;
                          String itemDescription = _controllerDescription.text;

                          //Create a Map of data
                          Map<String, String> dataToSend = {
                            'name': itemName,
                            'description': itemDescription,
                            'location': itemLocation,
                            'image': imageUrl,
                          };
                          int timeSpent = DateTime.now().microsecondsSinceEpoch - now.microsecondsSinceEpoch;

                          //Add a new item
                          _reference.add(dataToSend);

                          final timerr = LostTimerModel(tiempo: timeSpent);

                          //Add a new item
                          LostTimerRepository.instance.createLostTimer(timerr);
                        }
                      },
                      child: const Text('Submit'))),

              Visibility(
                  visible: _isConnected == false,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (newImagePath.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Please upload an image')));
                          print("PANICOOOOOOO");
                          print(DataLocalFound.getAllFounds());

                          return;
                        }
                        print(DataLocalFound.getAllFounds());

                        if (key.currentState!.validate()) {
                          String itemName = _controllerName.text;
                          String itemLocation = _controllerLocation.text;
                          String itemDescription = _controllerDescription.text;

                          //Create a Map of data
                          LostModel elcoso = LostModel(description: itemDescription, image: newImagePath, name: itemName, location: itemLocation);
                          Map<String, String> dataToSend = {
                            'name': itemName,
                            'description': itemDescription,
                            'location': itemLocation,
                            'image': newImagePath,
                          };
                          int timeSpent = DateTime.now().microsecondsSinceEpoch - now.microsecondsSinceEpoch;
                          print(DataLocalFound.getAllFounds());
                          DataLocalFound.addFound(elcoso);

                          //Add a new item

                          //Add a new item
                        }
                      },
                      child: const Text('Submit'))),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _connectionStatus = connectivityResult;
    });

    if (_connectionStatus == ConnectivityResult.none) {
      _isConnected=false;
      // Realizar un comportamiento específico cuando no hay conexión
      // Por ejemplo, mostrar un diálogo o un mensaje
      // Puedes usar showDialog() para mostrar un diálogo informativo
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sin conexión'),
            content: const Text('No tienes conexión a internet, la informacion mostrada puede estar desactualizada.'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Realizar un comportamiento específico cuando hay conexión
      // Por ejemplo, cargar datos desde una API o realizar alguna acción
      // Puedes colocar aquí el código para realizar esa acción


    }
  }




}