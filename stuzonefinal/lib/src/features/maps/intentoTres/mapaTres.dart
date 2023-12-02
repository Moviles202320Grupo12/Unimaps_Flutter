import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackingPage extends StatefulWidget{
  const TrackingPage({Key? key}) : super (key: key);

  @override
  State<TrackingPage> createState() => TrackingPageState();
}

class TrackingPageState extends State<TrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation =LatLng(4.601224016343051, -74.06627833843231);
  static const LatLng destination =LatLng(4.60268, -74.064978);

  requestPermisson() {
    Geolocator.requestPermission();
  }

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation () async{
    Location location = Location();

    GoogleMapController googleMapController = await _controller.future;

    location.getLocation().then((location) {
      currentLocation = location;
    },);
    
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 15,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
          ),
          ),
      ),
      );

      setState(() {

      });
    });

  }



  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBBUP4-ZGPc74WtV-3z0BamxEOHBwayChg",
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));
    
    if (result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {

      });
    }
    
  }

  @override
  void initState() {
    requestPermisson();
    getCurrentLocation();
    getPolyPoints();

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
      ),
      body: currentLocation == null
        ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 15
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.deepOrange,
            width: 6
          ),
        },
        markers: {
          Marker(
            markerId: MarkerId("currentLocation"),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
          const Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),

    );
  }

}