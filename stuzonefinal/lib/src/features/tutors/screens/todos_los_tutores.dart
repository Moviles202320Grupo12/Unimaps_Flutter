import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/tutors/models/tutor_model.dart';
import 'package:stuzonefinal/src/features/tutors/controllers/tutor_controller.dart';
import 'package:stuzonefinal/src/features/tutors/screens/crear_tutor.dart';
import 'package:stuzonefinal/src/features/tutors/screens/ranking_tutores.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class AllTutors extends StatelessWidget {
  AllTutors({Key? key}) : super(key: key);

  final controller = Get.put(TutorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left,)),
        title: Text("Tutors", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("All Tutors", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => AddTutor());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(40, 40)),
                  child: const Text(
                    "Crear Nuevo tutor",
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
                    Get.to(() => RankingTutor());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(40, 40)),
                  child: const Text(
                    "Ranking",
                    style: TextStyle(
                        color: Color(0xFFF6A700),
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Expanded(child:
              FutureBuilder<List<TutorModel>>(
                future: controller.getAllTutors(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xBBBB87400),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: const Border(bottom: BorderSide(), top: BorderSide(), left: BorderSide(), right: BorderSide(), )
                                  ),

                                ),
                                Text(snapshot.data![index].name,
                                    style: TextStyle(
                                        color: Color(0xFFF6A700),
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(snapshot.data![index].email,
                                    style: TextStyle(
                                        color: Color(0xFFF6A700),
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10)),
                                Text(snapshot.data![index].phoneNo,
                                    style: TextStyle(
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
