import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/utils/local_db_lost.dart';

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

  late ConnectivityResult _connectionStatus;

  final controller = Get.put(LostController());

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
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

  String popo = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
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
                  popo = value;
                },
                decoration: InputDecoration(
                  labelText: '',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 10),


            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const AddItem());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, minimumSize: const Size(40, 40)),
                child: const Text(
                  "Reportar Objeto Encontrado",
                  style: TextStyle(
                      color: Color(0xFFF6A700),
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),Visibility(
                visible: _isConnected == false,
                child: const Text(
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
                          return Visibility(
                              visible: snapshot.data![index].name.toLowerCase().contains(popo.toLowerCase()),
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
                              Text(snapshot.data![index].name,
                                  style: const TextStyle(
                                      color: Color(0xFFF6A700),
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text(snapshot.data![index].description,
                                  style: const TextStyle(
                                      color: Color(0xFFF6A700),
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10)),
                              Text(snapshot.data![index].location,
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
                          ));
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
            content: const Text('No tienes conexión a internet, la informacion mostrada puede estar desactualizada.'),
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
      Future<List<LostModel>> popo = controller.getAllLosts();
      print("por lo menos trata de hacer algoooo");
      DataLocalLost.actualizarbd(popo);

    }
  }

}

