import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RepoTrabajos extends StatefulWidget {
  @override
  _RepoTrabajos createState() => _RepoTrabajos();
}

class _RepoTrabajos extends State<RepoTrabajos> {
  final DatabaseReference mainReference =
      FirebaseDatabase.instance.reference().child('Database');

  String createCryptoRandomString([int length = 32]) {
    final Random random = Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  void documentFileUpload(String url) {
    var data = {
      "PDF": url,
      "FileName": "My new Book",
    };

    mainReference.child(createCryptoRandomString()).set(data).then((v) {
      print("Saved Successfully");
    });
  }

  Future savePdf(List<int> asset, String name) async {
    final reference = FirebaseStorage.instance.ref().child(name);
    UploadTask uploadTask = reference
        .putData(Uint8List.fromList(asset)); // Convert to Uint8List here
    String url = await (await uploadTask).ref.getDownloadURL();
    documentFileUpload(url);
  }

  Future getPdfAndUpload() async {
    var rng = Random();
    String randomName =
        List.generate(20, (_) => rng.nextInt(100).toString()).join();

    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.custom);

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = '${randomName}.pdf';
      savePdf(await file.readAsBytes(), fileName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositorio de Trabajos UniAndes'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getPdfAndUpload,
        child: const Icon(
          Icons.add,
          color: Colors.amber,
        ),
      ),
      body: Center(
        child: Text("Upload your files"),
      ),
    );
  }
}
