import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stuzonefinal/src/features/maps/ui/pages/home/home_map_controller.dart';

class HomeMap extends StatelessWidget{
  const HomeMap({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context){


    return ChangeNotifierProvider<HomeMapController>(
      create: (_){
        final controller = HomeMapController();
        controller.onMarkerTap.listen((String id) {
          print("go to $id");

        });
        return controller;

      },
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<HomeMapController>(
          builder: (_, controller, __)=> GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: controller.initialCameraPosition,
            myLocationButtonEnabled: false,
            markers: controller.markers,
            //zoomGesturesEnabled : false,
            //zoomControlsEnabled: true,
            mapType: MapType.normal,
            onTap: controller.onTap,
          ),
        )
      )
    );
  }
}

