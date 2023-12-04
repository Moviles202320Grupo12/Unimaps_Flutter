import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/events/models/event_model.dart';
import 'package:stuzonefinal/src/features/events/controllers/event_controller.dart';

import 'package:stuzonefinal/src/features/events/screens/eventos_populares.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';

import '../../../constants/colors.dart';

class AllEvents extends StatelessWidget {
  AllEvents({Key? key}) : super(key: key);

  final controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left,)),
        title: Text("Events", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("All Events", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    //TENGO QUE CAMBIAR ESTA MIERDA
                    _launchgmail();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, minimumSize: const Size(40, 40)),
                  child: const Text(
                    "Crear Nuevo Evento",
                    style: TextStyle(
                        color: Color(0xFFF6A700),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
               Center(
                child: ElevatedButton(
                  onPressed: () {
                  Get.to(() => EventosPops());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, minimumSize: const Size(40, 40)),
                  child: const Text(
                    "Evento más popular",
                    style: TextStyle(
                        color: Color(0xFFF6A700),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Expanded(child:
              FutureBuilder<List<EventModel>>(
                future: controller.getAllEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(

                            itemCount: snapshot.data!.length,
                            itemBuilder: (c, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(DetailedEvent(event: snapshot.data![index]));
                                  final neweventData = EventModel(
                                      id: snapshot.data![index].id,
                                      nombre: snapshot.data![index].nombre,
                                      activo: snapshot.data![index].activo,
                                      image: snapshot.data![index].image,
                                      categoria: snapshot.data![index].categoria,
                                      consultas: snapshot.data![index].consultas+1,
                                      lugar: snapshot.data![index].lugar,
                                    fecha: snapshot.data![index].fecha
                                  );

                                  controller.updateRecord(neweventData);

                                },
                                child: Column(
                                  children: [
                                    Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                    color: const Color(0xbbbb87400),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: const Border(bottom: BorderSide(), top: BorderSide(), left: BorderSide(), right: BorderSide(), )
                                ),

                                ),
                                Text(snapshot.data![index].nombre,
                                  style: const TextStyle(
                                  color: Color(0xFFF6A700),
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                                  Text(snapshot.data![index].lugar,
                                  style: const TextStyle(
                                  color: Color(0xFFF6A700),
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10)),
                                Text(snapshot.data![index].fecha,
                                  style: const TextStyle(
                                  color: Color(0xFFF6A700),
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                                CachedNetworkImage(
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

                                const SizedBox(
                                  height: 10,
                                )
                                ],
                              ),
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

class DetailedEvent extends StatelessWidget {
  final EventModel event;


  const DetailedEvent({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.nombre),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                        width: 380, // Ancho de la imagen
                        height: 200, // Altura de la imagen
                        child: CachedNetworkImage(
                          imageUrl: event.image,
                          placeholder: (context, url) {
                            // Si no hay conexión o la imagen no se puede cargar, muestra la imagen predeterminada desde el almacenamiento local
                            return Image.asset(defaultLostProperty);
                          },
                          errorWidget: (context, url, error) {
                            // Si ocurre un error al cargar la imagen, muestra la imagen predeterminada desde el almacenamiento local
                            return Image.asset(defaultLostProperty);
                          },
                        ),),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Nombre: ${event.nombre}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Lugar: ${event.lugar}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xbbbb87400),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Fecha: ${event.fecha} \n Esta es la descripcion del evento. Esta es la descripcion del evento. Esta es la descripcion del evento. Esta es la descripcion del evento. Esta es la descripcion del evento.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}