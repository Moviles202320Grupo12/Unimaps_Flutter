import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PdfViewerPage extends StatefulWidget {
  final String url;

  PdfViewerPage({required this.url});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String localPath = '';

  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  Future<void> downloadFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/temp.pdf';
    final response = await http.get(Uri.parse(widget.url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    setState(() {
      localPath = filePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizador de Archivo'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.amber,
      ),
      body: localPath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localPath,
            ),
    );
  }
}
