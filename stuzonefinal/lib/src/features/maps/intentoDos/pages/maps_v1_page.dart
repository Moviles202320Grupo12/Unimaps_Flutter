// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_google_maps/data_dummy.dart';
// import 'package:flutter_google_maps/map_type_google.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapsV1Page extends StatefulWidget {
//   const MapsV1Page({super.key});

//   @override
//   State<MapsV1Page> createState() => _MapsV1PageState();
// }

// class _MapsV1PageState extends State<MapsV1Page> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   double latitude = -6.195069337825773;

//   double longitude = 106.79482953711616;

//   var mapType = MapType.normal;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Google Maps V1"),
//         actions: [
//           PopupMenuButton(
//             onSelected: onSelectedMapType,
//             itemBuilder: (context) {
//               return googleMapTypes.map((typeGoogle) {
//                 return PopupMenuItem(
//                   value: typeGoogle.type,
//                   child: Text(typeGoogle.type.name),
//                 );
//               }).toList();
//             },
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Google Maps
//           _buildGoogleMaps(),

//           // Kartu Tempat
//           -_buildDetailCard(),
//         ],
//       ),
//     );
//   }

//   _buildGoogleMaps() {
//     return GoogleMap(
//       mapType: mapType,
//       initialCameraPosition: CameraPosition(
//         target: LatLng(latitude, longitude),
//         zoom: 17,
//       ),
//       markers: markers,
//       onMapCreated: (GoogleMapController controller) {
//         _controller.complete(controller);
//       },
//     );
//   }

//   void onSelectedMapType(Type value) {
//     setState(() {
//       switch (value) {
//         case Type.Normal:
//           // Map type berubah
//           mapType = MapType.normal;
//           break;
//         case Type.Hybrid:
//           // Map type berubah
//           mapType = MapType.hybrid;
//           break;
//         case Type.Terrain:
//           // Map type berubah
//           mapType = MapType.terrain;
//           break;
//         case Type.Satellite:
//           // Map type berubah
//           mapType = MapType.satellite;
//           break;
//         default:
//       }
//     });
//   }

//   _buildDetailCard() {
//     return Align(
//         alignment: Alignment.bottomCenter,
//         child: SizedBox(
//           height: 150,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               const SizedBox(
//                 width: 10,
//               ),
//               _displayPlaceCard(
//                   "https://idn.sch.id/wp-content/uploads/2016/10/ima-studio.png",
//                   "ImaStudio",
//                   -6.1952988,
//                   106.7926625),
//               const SizedBox(
//                 width: 10,
//               ),
//               _displayPlaceCard(
//                   "https://2.bp.blogspot.com/-0WirdbkDv4U/WxUkajG0pAI/AAAAAAAADNA/FysRjLMqCrw_XkcU0IQwuqgKwXaPpRLRgCLcBGAs/s1600/1528109954774.jpg",
//                   "Monas",
//                   -6.1753871,
//                   106.8249587),
//               const SizedBox(
//                 width: 10,
//               ),
//               _displayPlaceCard(
//                   "https://cdn1-production-images-kly.akamaized.net/n8uNqIv9lZ3PJVYw-8rfy8DZotE=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/925193/original/054708200_1436525200-6-Masjid-Megah-Istiqlal.jpg",
//                   "Masjid Istiqlal",
//                   -6.1702229,
//                   106.8293614),
//               const SizedBox(
//                 width: 10,
//               ),
//               _displayPlaceCard(
//                   "https://img-z.okeinfo.net/library/images/2018/08/14/gtesxf7d7xil1zry76xn_14364.jpg",
//                   "Istana Merdeka",
//                   -6.1701238,
//                   106.8219881),
//               const SizedBox(
//                 width: 10,
//               ),
//             ],
//           ),
//         ));
//   }

//   _displayPlaceCard(String imageUrl, String name, double lat, double lgn) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         width: MediaQuery.of(context).size.width - 30,
//         height: 90,
//         margin: const EdgeInsets.only(bottom: 30),
//         child: Material(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(25),
//           elevation: 10,
//           child: Row(
//             children: [
//               Container(
//                 width: 90,
//                 height: 90,
//                 margin: const EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                         image: NetworkImage(imageUrl), fit: BoxFit.cover)),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     Row(
//                       children: [
//                         const Text(
//                           "4.9",
//                           style: TextStyle(fontSize: 15),
//                         ),
//                         Row(
//                           children: stars(),
//                         )
//                       ],
//                     ),
//                     const Text(
//                       "Indonesia \u00B7 Jakarta Barat",
//                       style: TextStyle(color: Colors.black, fontSize: 15),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const Expanded(
//                       child: Text(
//                         "Closed \u00B7 Open 09.00 Monday",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> stars() {
//     List<Widget> list1 = [];
//     for (var i = 0; i < 5; i++) {
//       list1.add(const Icon(
//         Icons.star,
//         color: Colors.orange,
//         size: 15,
//       ));
//     }
//     return list1;
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ui/pages/home/utils/image_to_bytes.dart';
import '../data_dummy.dart';
import '../map_type_google.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsV1Page extends StatefulWidget {
  const MapsV1Page({Key? key}) : super(key: key);

  @override
  _MapsV1PageState createState() => _MapsV1PageState();
}

class _MapsV1PageState extends State<MapsV1Page> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  double latitude = 4.601182;
  double longitude = -74.065069;

  var mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps v1"),
        actions: [
          PopupMenuButton(
            onSelected: onSelectedMapType,
            itemBuilder: (context) {
              return googleMapTypes.map((typeGoogle) {
                return PopupMenuItem(
                    value: typeGoogle.type, child: Text(typeGoogle.type.name));
              }).toList();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          // GOOGLE MAPS
      FutureBuilder<Widget>(
      future: _buildGoogleMaps(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se espera la resolución del futuro
          return const CircularProgressIndicator(); // o cualquier otro indicador de carga
        } else if (snapshot.hasError) {
          // Si ocurre un error al resolver el futuro
          return const Text('Error al cargar el widget');
        } else {
          // Cuando el futuro se resuelve exitosamente
          return snapshot.data ?? Container(); // El widget resuelto del futuro
        }
      },
    ),

          // KARTU TEMPAT
          _buildDetailCard()
        ],
      ),
    );
  }

  Future<Widget> _buildGoogleMaps() async {
    Set<Marker> remarkers = {
      Marker(
          markerId: const MarkerId("edificioML"),
          position: const LatLng(4.602936, -74.064827),
          infoWindow: const InfoWindow(title: "EdificioML"),
          icon: BitmapDescriptor.fromBytes(
    await  imageToBytes("https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fml.jpg?alt=media&token=693d3a4a-bccf-4564-a669-00a9a8a47d7a", fromNetwork: true),
    )),
      Marker(
          markerId: const MarkerId("edificioC"),
          position: const LatLng(4.601182, -74.065069),
          infoWindow: const InfoWindow(title: "edificioC"),
          icon: BitmapDescriptor.fromBytes(
            await  imageToBytes("https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fc.jpg?alt=media&token=5a17bf07-2bf8-4113-b2ed-4ea496545c3d", fromNetwork: true),
          )),
      Marker(
          markerId: const MarkerId("biblioDerecho"),
          position: const LatLng(4.601924, -74.065561),
          infoWindow: const InfoWindow(title: "biblioDerecho"),
          icon: BitmapDescriptor.fromBytes(
            await  imageToBytes("https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fder.jpg?alt=media&token=20127e23-a0fd-414f-a656-30b08178f5dc", fromNetwork: true),
          )),
      Marker(
          markerId: const MarkerId("EdificioB"),
          position: const LatLng(4.601457, -74.065677),
          infoWindow: const InfoWindow(title: "EdificioB"),
          icon: BitmapDescriptor.fromBytes(
            await  imageToBytes("https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fb.jpg?alt=media&token=75e8000c-63d6-4fd6-9eb3-04161434f154", fromNetwork: true),
          ))
    };
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 18,

      ),
      zoomGesturesEnabled: false,
      markers: remarkers,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  void onSelectedMapType(Type value) {
    setState(() {
      switch (value) {
        case Type.Normal:
// Map type berubah
          mapType = MapType.normal;
          break;
        case Type.Hybrid:
// Map type berubah
          mapType = MapType.hybrid;
          break;
        case Type.Terrain:
// Map type berubah
          mapType = MapType.terrain;
          break;
        case Type.Satellite:
// Map type berubah
          mapType = MapType.satellite;
          break;
        default:
      }
    });
  }

  _buildDetailCard() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 10,
              ),
              _displayPlaceCard(
                  "https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fml.jpg?alt=media&token=693d3a4a-bccf-4564-a669-00a9a8a47d7a",
                  "Edificio ML",
                  4.602936,
                  -74.064827,
              "Mario Laserna",
              "Click para ir!"),
              const SizedBox(
                width: 10,
              ),
              _displayPlaceCard(
                  "https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fc.jpg?alt=media&token=5a17bf07-2bf8-4113-b2ed-4ea496545c3d",
                  "Edificio C",
                  4.601182,
                  -74.065069,
                  "Dpto Arquitectura",
                  "Click para ir!"),
              const SizedBox(
                width: 10,
              ),
              _displayPlaceCard(
                  "https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fder.jpg?alt=media&token=20127e23-a0fd-414f-a656-30b08178f5dc",
                  "Biblioteca Derecho",
                  4.601924,
                  -74.065561,
                  "Eduardo Correa",
                  "Click para ir!"),
              const SizedBox(
                width: 10,
              ),
              _displayPlaceCard(
                  "https://firebasestorage.googleapis.com/v0/b/stuzone-8afd7.appspot.com/o/maps%2Fb.jpg?alt=media&token=75e8000c-63d6-4fd6-9eb3-04161434f154",
                  "EdificioB",
                  4.601457,
                  -74.065677,
                  "Labs Fisica",
                  "Click para ir!"),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ));
  }

  _displayPlaceCard(String imageUrl, String name, double lat, double lgn, String desc1, String desc2) {
    return GestureDetector(
      onTap: () {
        _onClickPlaceCard(lat, lgn);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 90,
        margin: const EdgeInsets.only(bottom: 30),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          elevation: 10,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                        Text(
                          desc1,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          child: Text(
                            desc2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    openInGoogleMaps(lat, lgn);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  List<Widget> stars() {
    List<Widget> list1 = [];
    for (var i = 0; i < 5; i++) {
      list1.add(const Icon(
        Icons.star,
        color: Colors.orange,
        size: 15,
      ));
    }
    return list1;
  }

  void _onClickPlaceCard(double lat, double lgn) async {
    setState(() {
      latitude = lat;
      longitude = lgn;
    });

    GoogleMapController controller = await _controller.future;
    final cameraPosition = CameraPosition(
        target: LatLng(latitude, longitude), zoom: 18, bearing: 192, tilt: 55);
    final cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
    controller.animateCamera(cameraUpdate);
  }
}

Future<void> openInGoogleMaps(double latitude, double longitude) async {
  final Uri toLaunch = Uri(
    scheme: 'https',
    host: 'www.waze.com',
    path: 'ul',
    queryParameters: {
      'll': '$latitude,$longitude',
      'navigate': 'yes',
    },
  );
  if (!await launchUrl(
    toLaunch,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $toLaunch');
  }
}