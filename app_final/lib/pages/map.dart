import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _Map();
}

class _Map extends State<Map> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final mapa_google = GoogleMap(
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

    final caja_menu = Container(
      margin: EdgeInsets.only(top: height - 150),
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
      top: height - 150, // Device height minus 200
      left: 1,
      right: 1,
      child: const Opacity(
        opacity: 1, // Adjust the opacity as needed
        child: Opacity(
            opacity: 0.99,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xbbbbbf7f8f9),
                  border: OutlineInputBorder(),
                  labelText: 'Edificio ML',
                  labelStyle: TextStyle(color: Colors.black45),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black))),
            )),
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
          children: [mapa_google, caja_menu, busqueda],
        ),
      )),
    );
  }
}
