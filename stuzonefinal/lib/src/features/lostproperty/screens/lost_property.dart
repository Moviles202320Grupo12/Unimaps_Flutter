import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/utils/local_db_lost.dart';
import 'find_lost_property.dart';
import 'package:stuzonefinal/src/features/lostproperty/screens/crear_con_back.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import 'package:stuzonefinal/src/features/lostproperty/controllers/lost_controller.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';
import 'package:get/get.dart';

import 'package:connectivity/connectivity.dart';
class LostProperty extends StatefulWidget {
  const LostProperty({Key? key}) : super(key: key);
  @override
  State createState() => LostPropertyHome();
  //Widget build(BuildContext context) {
  //  return MaterialApp(home: LostPropertyHome());
  //}
}

class LostPropertyHome extends State<LostProperty> {


  bool? _isInternetAvailableOnCall;

  bool? _isInternetAvailableStreamStatus;

  bool _isConnected = true;

  final controller = Get.put(LostController());

  @override
  void initState() {
    super.initState();
    // Suscripción a los cambios de conectividad
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
        if (_isConnected==true){
          Future<List<LostModel>> popo = controller.getAllLosts();
          DataLocalLost.actualizarbd(popo);

        }
      });
    });
  }
  static const black_titles = Color(0x00090909);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context,
                '/lost_property.dart'); // Regresar a la ventana anterior
          },
        ),
        centerTitle: true,
        title: const Text(
          'Objetos Perdidos',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {
                  // Handle search logic here
                },
                decoration: InputDecoration(
                  labelText: '',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Categorias",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(40, 40)),
                  child: const Text("Celulares",
                      style: TextStyle(
                          color: Color(0xFFF6A700),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón 2
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(40, 40)),
                  child: const Text("Libros",
                      style: TextStyle(
                          color: Color(0xFFF6A700),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón 3
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(40, 40)),
                  child: const Text("PCs",
                      style: TextStyle(
                          color: Color(0xFFF6A700),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón 3
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(40, 40)),
                  child: const Text("Otros",
                      style: TextStyle(
                          color: Color(0xFFF6A700),
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )
              ],
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => AddItem());
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(40, 40)),
                child: const Text(
                  "Reportar Objeto perdido",
                  style: TextStyle(
                      color: Color(0xFFF6A700),
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),Visibility(
                visible: _isConnected == false,
                child: Text(
                  'NO TIENES CONEXION A INTERNET',
                  style: TextStyle(fontSize: 24),
            )),
            Expanded(child:
            FutureBuilder<List<LostModel>>(
              future: controller.getAllLosts(),
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
                              Text(snapshot.data![index].description,
                                  style: TextStyle(
                                      color: Color(0xFFF6A700),
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10)),
                              Text(snapshot.data![index].location,
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
            )
          ],
        ),

    );
  }

}

