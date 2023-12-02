import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/features/core/screens/pdfviewerpage.dart';

class FileData {
  final String url;
  final String name;

  FileData({required this.url, required this.name});
}

class RepoTrabajos extends StatefulWidget {
  @override
  _RepoTrabajos createState() => _RepoTrabajos();
}

class _RepoTrabajos extends State<RepoTrabajos> {

  List<FileData> files = [];

  @override
  void initState() {
    super.initState();
    loadFiles();
  }

  void loadFiles() async {
    final ListResult result =
        await FirebaseStorage.instance.ref('trabajos/').listAll();
    List<FileData> filesData = [];
    for (var item in result.items) {
      final String url = await item.getDownloadURL();
      filesData.add(FileData(url: url, name: item.name));
    }
    setState(() {
      files = filesData;
    });

    print("--->");
    print(files);

  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;
    return status.isGranted;
  }

  String createCryptoRandomString([int length = 32]) {
    final Random random = Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  void documentFileUpload(String url, Function onUploadComplete) {
    var data = {
      "PDF": url,
      "FileName": "My new Book",
    };

    mainReference.child(createCryptoRandomString()).set(data).then((v) {
      print("Saved Successfully");
      onUploadComplete();
    });
  }

  Future savePdf(List<int> asset, String name) async {
    try {
      final reference = FirebaseStorage.instance.ref().child('trabajos/$name');
      UploadTask uploadTask = reference.putData(Uint8List.fromList(asset));
      String url = await (await uploadTask).ref.getDownloadURL();
      documentFileUpload(url, () {
        print("Callback Triggered"); // Debug print
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Upload Complete"),
              content: Text("Archivo subido correctamente"),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    } catch (e) {
      print("An error occurred: $e"); // Print any errors
    }
  }

  Future getPdfAndUpload() async {
    bool isGranted = await checkStoragePermission();
    if (!isGranted) {
      await requestStoragePermission();
      // Re-check after requesting
      isGranted = await checkStoragePermission();
      if (!isGranted) {
        // Handle the scenario when permission is denied
        print('Storage permission denied');
        return;
      }
    }
    var rng = Random();
    String randomName =
        List.generate(20, (_) => rng.nextInt(100).toString()).join();

    // Updated FilePicker call
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'] // Specify 'pdf' here without the dot
        );
    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = '${randomName}.pdf';
      savePdf(await file.readAsBytes(), fileName);
    }
  }

  // Build function for the UI
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
        child: const Icon(Icons.add, color: Colors.amber),
      ),
      body: files.isEmpty
          ? Center(child: Text("No files uploadessd"))
          : ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(files[index].name),
                  subtitle: Text(files[index].url),
                  onTap: () => _openPdf(context, files[index].url),
                );
              },
            ),
    );
  }

  void _openPdf(BuildContext context, String url) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PDFViewPage(url: url),
    ));
  }
}

// Una nueva pantalla para mostrar el PDF
class PDFViewPage extends StatelessWidget {
  final String url;

  PDFViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver PDF'),
      ),
      body: files.isEmpty
          ? Center(child: Text("Cargando archivos ..."))
          : ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.picture_as_pdf,
                      color: Colors.red), // Icono de PDF
                  title: Text(files[index].name),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PdfViewerPage(url: files[index].url),
                      ),
                    );
                  },
                );
              },
            ),

    );
  }
}

/*
PDFView(
        filePath: widget.url,
      )
*/