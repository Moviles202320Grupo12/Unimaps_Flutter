import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stuzonefinal/src/features/maps/ui/pages/home/utils/image_to_bytes.dart';
import 'package:stuzonefinal/src/features/maps/ui/pages/home/utils/map_style.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';


class HomeMapController extends ChangeNotifier {

  Map<MarkerId, Marker> _markers = {};


  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();

  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = CameraPosition(
      target: LatLng(4.601224016343051, -74.06627833843231),
      zoom: 20
  );

  void onMapCreated(GoogleMapController controller){
    //controller.setMapStyle(mapStyle);

  }

  void onTap(LatLng position) async{
    final id = _markers.length.toString();
    final markerId = MarkerId(id);

    final laimagen = BitmapDescriptor.fromBytes(
        await  imageToBytes("https://decanaturadeestudiantes.uniandes.edu.co/sites/default/files/pictures/Futsala-640x480.jpg", fromNetwork: true),
    );

    final marker = Marker(
        markerId: markerId,
        position: position,
        //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        icon: laimagen,
        rotation: 45,
        onTap: () {
          _markersController.sink.add(id);
          print(position);
        }
    );
    _markers[markerId]= marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }

}