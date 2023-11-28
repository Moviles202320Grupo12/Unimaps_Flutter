import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/time_register_model.dart';
import 'package:stuzonefinal/src/repository/lost_repository/time_reg_lostpropRepo.dart';

import 'package:connectivity/connectivity.dart';
import 'package:stuzonefinal/src/utils/local_db_lost.dart';
class AddItemFound extends StatefulWidget {
  const AddItemFound({Key? key}) : super(key: key);

  @override
  State<AddItemFound> createState() => _AddItemFoundState();
}

class _AddItemFoundState extends State<AddItemFound> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerLocation = TextEditingController();

  File? _imageFile;

  GlobalKey<FormState> key = GlobalKey();
  bool _isConnected = true;

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('foundproperty');

  String imageUrl = '';
  String newImagePath = '';
  final now = DateTime.now();


  @override
  void initState() {
    super.initState();
    // Suscripción a los cambios de conectividad
    print("A VER QUE PUTAS");
    print(DataLocalLost.getAllLosts());
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
        title: Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              Text(
                'Fecha y Hora Actual: $now',
                style: TextStyle(fontSize: 24),),
              TextFormField(
                controller: _controllerName,
                decoration:
                InputDecoration(hintText: 'Enter the name of the item'),
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
                InputDecoration(hintText: 'Enter the description of the item'),
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
                InputDecoration(hintText: 'Enter the location of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item location';
                  }

                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _mostrarFoto();
                },
                child: Text('Mostrar Foto Guardada'),
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

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();

                    /*Step 2: Upload to Firebase storage*/
                    //Install firebase_storage
                    //Import the library

                    //Get a reference to storage root
                    if (_isConnected==true){
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                      referenceRoot.child('lostImages');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);

                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file!.path));
                        //Success: get the download URL
                        imageUrl = await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        //Some error occurred
                      }
                    }
                    else{
                      Directory appDir = await getApplicationDocumentsDirectory();
                      String appDirPath = appDir.path;


                      // Creamos una nueva ruta para guardar la imagen en el directorio de almacenamiento local
                      newImagePath = '$appDirPath/sample_image.jpg';

                      // Copiamos la imagen en la nueva ruta
                      File newImage = await File(file.path).copy(newImagePath);
                    }

                  },
                  icon: Icon(Icons.camera_alt)),
              Visibility(
                  visible: _isConnected == true,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (imageUrl.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Please upload an image')));

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
                      child: Text('Submit'))),

              Visibility(
                  visible: _isConnected == false,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (newImagePath.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Please upload an image')));
                          print("PANICOOOOOOO");
                          print(DataLocalLost.getAllLosts());

                          return;
                        }
                        print("NECESITO QUE ESTA MIERDA SUCEDA");
                        print(DataLocalLost.getAllLosts());

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
                          print(DataLocalLost.getAllLosts());
                          DataLocalLost.addLost(elcoso);

                          //Add a new item

                          //Add a new item
                        }
                      },
                      child: Text('Submit'))),
            ],
          ),
        ),
      ),
    );
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