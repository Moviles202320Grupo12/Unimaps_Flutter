import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/events/models/event_model.dart';
import 'package:stuzonefinal/src/features/events/controllers/event_controller.dart';
import 'package:stuzonefinal/src/features/tutors/screens/crear_tutor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class EventosPops extends StatefulWidget {
  EventosPops({Key? key}) : super(key: key);

  @override
  State<EventosPops> createState() => EventosPopsState();
}

class EventosPopsState extends State<EventosPops>{


  final controller = Get.put(EventController());
  StreamSubscription<bool>? _networkConnectionStream;
  bool _isConnected = true;

  late ConnectivityResult _connectionStatus;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    // Suscripción a los cambios de conectividad
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _connectionStatus = connectivityResult;
    });

    if (_connectionStatus == ConnectivityResult.none) {
      // Realizar un comportamiento específico cuando no hay conexión
      // Por ejemplo, mostrar un diálogo o un mensaje
      // Puedes usar showDialog() para mostrar un diálogo informativo
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sin conexión'),
            content: const Text('OJO!! El ranking puede estar desactualizado.'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Realizar un comportamiento específico cuando hay conexión
      // Por ejemplo, cargar datos desde una API o realizar alguna acción
      // Puedes colocar aquí el código para realizar esa acción


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left,)),
        title: Text("TOP EVENTS", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),

              Expanded(child:
              FutureBuilder<List<EventModel>>(
                future: controller.getAllEventsSorted(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, index) {
                            final eventoo = snapshot.data![index];
                            return Column(
                              children: [
                                SizedBox(
                                  height: 130,

                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        height: 100,
                                        width: 150,
                                        fit: BoxFit.cover,
                                        imageUrl: snapshot.data![index].image,
                                        placeholder: (context, url) {
                                          // Si no hay conexión o la imagen no se puede cargar, muestra la imagen predeterminada desde el almacenamiento local
                                          return Image.asset(defaultLostProperty);
                                        },
                                        errorWidget: (context, url, error) {
                                          // Si ocurre un error al cargar la imagen, muestra la imagen predeterminada desde el almacenamiento local
                                          return Image.asset(defaultLostProperty);
                                        },
                                      ),
                                      Container(
                                          width: 40,
                                          height: 40,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          child: Center(child: Text((index+1).toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,

                                            ),
                                          ),
                                          ),


                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            eventoo.nombre,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                            ),
                                          ),
                                          Text(
                                            "Consultas: ${eventoo.consultas.toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Expanded(
                                            child: Text(
                                              eventoo.categoria,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                )
                                ],
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              ),
            ],
          ),

    );
  }
}

_launchgmail() async {
  final Uri url = Uri.parse(
      'mailto:diegogonvar@outlook.es?subject=New Event&body=Event Characteristics ');
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
