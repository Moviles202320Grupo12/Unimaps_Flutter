import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stuzonefinal/src/features/tutors/models/tutor_model.dart';
import 'package:stuzonefinal/src/repository/tutor_repository/tutor_repository.dart';

class AddTutor extends StatefulWidget {
  const AddTutor({Key? key}) : super(key: key);

  @override
  State<AddTutor> createState() => _AddTutorState();
}

class _AddTutorState extends State<AddTutor> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhoneNoo = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('tutors');

  String imageUrl = '';

  List<TextEditingController> materiasControllers = [TextEditingController()];

  void _addMateriaField() {
    setState(() {
      materiasControllers.add(TextEditingController());
    });
  }

  List<TextEditingController> temasControllers = [TextEditingController()];

  void _addTemaField() {
    setState(() {
      temasControllers.add(TextEditingController());
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
              TextFormField(
                controller: _controllerName,
                decoration:
                InputDecoration(hintText: 'Enter the name of the tutor'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the tutor name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerEmail,
                decoration:
                InputDecoration(hintText: 'Enter the email of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email description';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerPhoneNoo,
                decoration:
                InputDecoration(hintText: 'Enter the phone number of the tutor'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number of the tutor';
                  }

                  return null;
                },
              ),
              for (var controller in materiasControllers)
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(labelText: 'Ingrese la materia'),
                ),
              ElevatedButton(
                onPressed: _addMateriaField,
                child: Text('Agregar Otra Materia'),
              ),
              for (var controller in temasControllers)
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(labelText: 'Ingrese el tema'),
                ),
              ElevatedButton(
                onPressed: _addTemaField,
                child: Text('Agregar Otro Tema'),
              ),

              ElevatedButton(
                  onPressed: () async {

                    if (key.currentState!.validate()) {
                      String tutorName = _controllerName.text;
                      String tutorEmail = _controllerEmail.text;
                      String tutorPhoneNoo = _controllerPhoneNoo.text;
                      List<String> materias = [];
                      for (var controller in materiasControllers) {
                        materias.add(controller.text);
                      }
                      List<String> topics = [];
                      for (var controller in temasControllers) {
                        topics.add(controller.text);
                      }

                      //Create a Map of data
                      final tutor = TutorModel(name: tutorName, email: tutorEmail, phoneNo: tutorPhoneNoo, subjects: materias, topics: topics);

                      //Add a new item
                      TutorRepository.instance.createTutor(tutor);
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}