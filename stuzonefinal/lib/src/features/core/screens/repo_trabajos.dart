import 'package:flutter/material.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class RepoTrabajos extends StatefulWidget {
  @override
  _RepoTrabajos createState() => _RepoTrabajos();
}

class _RepoTrabajos extends State<RepoTrabajos> {
  File? file;
  String? fileName;
/*
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      file = File(path);
      fileName = result.files.single.name;
    });
  }
*/
  Future uploadFile() async {
    if (file == null) return;

    final filePath = 'uploads/$fileName';
    final destination = FirebaseStorage.instance.ref().child(filePath);

    await destination.putFile(file!);
    final url = await destination.getDownloadURL();

    await FirebaseFirestore.instance.collection('uploads').add({
      'url': url,
      'name': fileName,
      // Add more metadata if needed
    });

    setState(() {
      file = null;
      fileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future getPdfAndUpload() async {
      var rng = new Random();
      String randomName = "";

      for (var i = 0; i < 20; i++) {
        print(rng.nextInt(100));
        randomName += rng.nextInt(100);
      }

      File file = await FilePicker.getFile(type: FileType.custom);
      String fileName = '${randomName}.pdf';
      savePdf(file.readAsBytesSync(), fileName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositorio de Trabajos UniAndes'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Navigator.push(getPdfAndUpload()),
        child: const Icon(
          Icons.add,
          color: Colors.amber,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (file != null) Text(fileName!),
            ElevatedButton(
              onPressed: null, //selectFile,
              child: Text('Seleccionar Archivo'),
            ),
            ElevatedButton(
              onPressed: uploadFile,
              child: Text('Subir Archivo'),
            ),
          ],
        ),
      ),
    );
  }
}
