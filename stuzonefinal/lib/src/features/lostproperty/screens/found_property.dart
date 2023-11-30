import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/utils/local_db_found.dart';
import 'find_lost_property.dart';
import 'package:stuzonefinal/src/features/lostproperty/screens/crear_con_found.dart';
import 'package:stuzonefinal/src/features/lostproperty/models/lostmodel.dart';
import 'package:stuzonefinal/src/features/lostproperty/controllers/found_controller.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';
import 'package:get/get.dart';

import 'package:connectivity/connectivity.dart';
class FoundProperty extends StatefulWidget {
  const FoundProperty({Key? key}) : super(key: key);
  @override
  State createState() => FoundPropertyHome();
//Widget build(BuildContext context) {
//  return MaterialApp(home: LostPropertyHome());
//}
}

class FoundPropertyHome extends State<FoundProperty> {


  bool? _isInternetAvailableOnCall;

  bool? _isInternetAvailableStreamStatus;

  bool _isConnected = true;

  late ConnectivityResult _connectionStatus;

  final controller = Get.put(FoundController());

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    // Suscripción a los cambios de conectividad
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
        if (_isConnected==true){
          Future<List<LostModel>> popo = controller.getAllFounds();
          DataLocalFound.actualizarbd(popo);

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
                '/found_property.dart'); // Regresar a la ventana anterior
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
                Get.to(() => AddItemFound());
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: Size(40, 40)),
              child: const Text(
                "Reportar Objeto Buscado",
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
          Expanded(
            child: FutureBuilder<List<LostModel>>(
              future: controller.getAllFounds(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<LostModel> foundItems = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: foundItems.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9, // Proporción de aspecto deseada
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                                  child: CachedNetworkImage(
                                    imageUrl: foundItems[index].image,
                                    placeholder: (context, url) {
                                      return Image.asset(defaultLostProperty);
                                    },
                                    errorWidget: (context, url, error) {
                                      return Image.asset(defaultLostProperty);
                                    },
                                    fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foundItems[index].name,
                                      style: TextStyle(
                                        color: Color(0xFFF6A700),
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      foundItems[index].description,
                                      style: TextStyle(
                                        color: Color(0xFFF6A700),
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      foundItems[index].location,
                                      style: TextStyle(
                                        color: Color(0xFFF6A700),
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
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
            title: Text('Sin conexión'),
            content: Text('No tienes conexión a internet, la informacion mostrada puede estar desactualizada.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Cerrar'),
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
      Future<List<LostModel>> popo = controller.getAllFounds();
      print("por lo menos trata de hacer algoooo");
      DataLocalFound.actualizarbd(popo);

    }
  }

}
