//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/authentication/screens/welcome/welcome_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:connectivity/connectivity.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _Map();
}

class _Map extends State<Map> {
  late GoogleMapController mapController;
  late LocationData currentLocation;
  Location location = Location();

  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    // Suscripción a los cambios de conectividad
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final mapaGoogle = GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: LatLng(4.637531247024522, -74.08290974945845),
        zoom: 15,
      ),
      indoorViewEnabled: true,
      scrollGesturesEnabled: true,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      compassEnabled: true,
    );

    final cajaMenu = Container(
      margin: EdgeInsets.only(top: height - 120),
      decoration: const ShapeDecoration(
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x192F2F2F),
            blurRadius: 20,
            offset: Offset(-10, 4),
            spreadRadius: 0,
          )
        ],
      ),
    );

    final busqueda = Positioned(
      top: height - 120, // Device height minus 200
      left: 1,
      right: 1,
      child: const Opacity(
        opacity: 0.8, // Adjust the opacity as needed
        child: SizedBox(
          height: 80.0, // Set the height
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.orange,
              ), // Existing search icon
              filled: true,
              fillColor: Color(0xbbbbbf7f8f9),
              border: OutlineInputBorder(),
              labelText: 'Edificio ML',
              labelStyle: TextStyle(color: Colors.orange),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
    final pasos = Positioned(
      top: height - 55,
      //bottom: ,
      child: SizedBox(
        height: 55, // Set the height
        width: MediaQuery.of(context).size.width / 4, // Set the width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          onPressed: () {
            Get.to(() => const LoginPage());
          },
          child: const Icon(
            Icons.directions_walk,
            color: Colors.amber,
          ),
        ),
      ),
    );
    final configuracion = Positioned(
      top: height - 55,
      left: (MediaQuery.of(context).size.width / 4),
      child: SizedBox(
        height: 55, // Set the height
        width: (MediaQuery.of(context).size.width / 4), // Set the width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          onPressed: () {
            Get.to(() => const LoginPage());
          },
          child: const Icon(
            Icons.settings,
            color: Colors.amber,
          ),
        ),
      ),
    );

    final eventos = Positioned(
      top: height - 55,
      left: (MediaQuery.of(context).size.width / 4) * 2,
      child: SizedBox(
        height: 55, // Set the height
        width: (MediaQuery.of(context).size.width / 4), // Set the width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          onPressed: () {
            Get.to(() => const LoginPage());
          },
          child: const Icon(
            Icons.event,
            color: Colors.amber,
          ),
        ),
      ),
    );

    final lostProperty = Positioned(
      top: height - 55,
      left: (MediaQuery.of(context).size.width / 4) * 3,
      child: SizedBox(
        height: 55, // Set the height
        width: (MediaQuery.of(context).size.width / 4), // Set the width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          onPressed: () {
            Get.to(() => const LoginPage());
          },
          child: const Icon(
            Icons.backpack,
            color: Colors.amber,
          ), // Icon for lost items
        ),
      ),
    );

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
          body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
          Visibility(
          visible: _isConnected == false,
          child: const Text(
            'Estas SIN INTERNET, no puedo mostrarte el mapa :(',
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),),
            Visibility(
              visible: _isConnected == true,
              child: mapaGoogle),
            cajaMenu,
            busqueda,
            configuracion,
            pasos,
            eventos,
            lostProperty
          ],
        ),
      )),
    );
  }
}
