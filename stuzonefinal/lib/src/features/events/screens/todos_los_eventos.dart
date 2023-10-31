import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/events/models/event_model.dart';
import 'package:stuzonefinal/src/features/events/controllers/event_controller.dart';
import 'package:stuzonefinal/src/features/tutors/screens/crear_tutor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
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
                      primary: Colors.black, minimumSize: Size(40, 40)),
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
              FutureBuilder<List<EventModel>>(
                future: controller.getAllEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: tPrimaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: const Border(bottom: BorderSide(), top: BorderSide(), left: BorderSide(), right: BorderSide(), )
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: tPrimaryColor,
                                      ),
                                      child: const Icon(LineAwesomeIcons.user_1, color: Colors.black),
                                    ),
                                    title: Text(snapshot.data![index].nombre, style: Theme.of(context).textTheme.headlineMedium,),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].lugar),
                                        Text(snapshot.data![index].fecha, overflow: TextOverflow.ellipsis),
                                        Text(snapshot.data![index].categoria, overflow: TextOverflow.ellipsis),
                                        Text(snapshot.data![index].activo, overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}

_launchgmail() async {
  final Uri _url = Uri.parse(
      'mailto:diegogonvar3005@gmail.com?subject=New Event&body=Event Characteristics ');
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
