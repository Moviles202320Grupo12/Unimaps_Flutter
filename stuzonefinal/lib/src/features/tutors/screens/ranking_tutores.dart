import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/tutors/models/tutor_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/tutor_controller.dart';


class RankingTutor extends StatelessWidget {
  const RankingTutor({super.key});



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TutorController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RANKING TUTORS'),
          backgroundColor: Colors.black87,
        ),
        body: FutureBuilder<List<TutorModel>>(
          future: controller.getAllTutorSorted(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error al cargar los datos'));
            } else if (!snapshot.hasData || snapshot.data==null) {
              return Center(child: Text('No se encontraron datos'));
            } else {
              return GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: snapshot.data!.map((tutor) {
                  return _buildCard(
                    tutor, controller
                  );
                }).toList(),
              );
            }
          },
        ) // Aquí reemplaza con tu widget que contiene el GridView
      ),
    );

  }

  Widget _buildCard(TutorModel tutor, TutorController controller) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(

            child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [

                  Hero(
                      tag: tutor.image,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(tutor.image),
                                  fit: BoxFit.contain)))),
                  const SizedBox(height: 7.0),
                  Text(tutor.name,
                      style: const TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(tutor.subjects[0],
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 11.0)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: const Color(0xFFEBEBEB), height: 1.0)),
                      
Center(
                child: TextButton(
  onPressed: () {},
  
  style: TextButton.styleFrom(
    
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  child: Text("llamadas: ${tutor.llamadas}"),
),
              ),

                            Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            SizedBox(height: 20,child: ElevatedButton(onPressed: () {

                              final newtutorData = TutorModel(
                                  id: tutor.id,
                                  name: tutor.name,
                                  email: tutor.email,
                                  phoneNo: tutor.phoneNo,
                                  image: tutor.image,
                                  llamadas: tutor.llamadas+1,
                                  subjects: tutor.subjects,
                                  topics: tutor.topics
                              );

                              controller.updateRecord(newtutorData);
                              _makePhoneCall(tutor.phoneNo);

                            },style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(254, 211, 83, 0.7),minimumSize: Size.zero, // Set this
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    //side: const BorderSide(width: 2, color: Colors.black, style: BorderStyle.solid)
                  ),child: const Text('Llamar', style: TextStyle(color: Colors.black, fontSize: 11),)),)
                          ]))
                ]))));
  }
}

void _makePhoneCall(String numero) async {
  // Reemplaza con el número que deseas marcar

  final url = 'tel:$numero';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir la app de teléfono';
  }
}