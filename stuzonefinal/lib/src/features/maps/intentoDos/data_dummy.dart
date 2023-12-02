import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Marker> markers = {
  Marker(
      markerId: const MarkerId("edificioML"),
      position: const LatLng(4.602936, -74.064827),
      infoWindow: const InfoWindow(title: "EdificioML"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
  Marker(
      markerId: const MarkerId("edificioC"),
      position: const LatLng(4.601182, -74.065069),
      infoWindow: const InfoWindow(title: "edificioC"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
  Marker(
      markerId: const MarkerId("biblioDerecho"),
      position: const LatLng(4.601924, -74.065561),
      infoWindow: const InfoWindow(title: "biblioDerecho"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
  Marker(
      markerId: const MarkerId("EdificioB"),
      position: const LatLng(4.601457, -74.065677),
      infoWindow: const InfoWindow(title: "EdificioB"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed))
};
