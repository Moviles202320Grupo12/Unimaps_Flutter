import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/tutors/models/tutor_model.dart';
import 'package:stuzonefinal/src/features/tutors/controllers/tutor_controller.dart';
import 'package:stuzonefinal/src/features/tutors/screens/crear_tutor.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
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
              FutureBuilder<List<TutorModel>>(
                future: controller.getAllTutors(),
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
                                    title: Text(snapshot.data![index].name, style: Theme.of(context).textTheme.headlineMedium,),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].phoneNo),
                                        Text(snapshot.data![index].email, overflow: TextOverflow.ellipsis),
                                        Text(snapshot.data![index].subjects[0], overflow: TextOverflow.ellipsis),
                                        Text(snapshot.data![index].topics[0], overflow: TextOverflow.ellipsis),
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
