import 'package:flutter/material.dart';

class LostProperty extends StatelessWidget {
  @override // Just for know we are overriding

  // Widget creation
  Widget build(BuildContext context) {
    return MaterialApp(home: LostPropertyHome());
  }
}

class LostPropertyHome extends StatelessWidget {
  // ignore: constant_identifier_names
  static const black_titles = Color(0x00090909);

  const LostPropertyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: (const Text('Objetos Perdidos',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold))),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    var searchString = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  labelText: '',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Categorias",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            )
          ],
        ));
  }

  void setState(Null Function() param0) {}
}
