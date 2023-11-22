// step_counter_app.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stuzonefinal/src/features/authentication/models/user_model.dart';
import 'package:stuzonefinal/src/features/walkingpoints/screens/cupones.dart';
import 'package:stuzonefinal/src/features/walkingpoints/screens/ranking.dart';
import '../../../constants/colors.dart';
import 'package:get/get.dart';
import 'package:decimal/decimal.dart';

import '../../core/controllers/profile_controller.dart';

import 'package:connectivity/connectivity.dart';

class ScreenWalk extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();


}


class _MyAppState extends State<ScreenWalk> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = 'stopped', _steps = '0';
  final controller = Get.put(ProfileController());
  int inicia=0;
  int bajarlo=0;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    fetchUserSteps();
    //inicia+=bajarlo;
    initPlatformState();
    //resetStepCount();
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });

  }

  void fetchUserSteps() async {
    bajarlo = await controller.getUserSteps();
    print(bajarlo);
  }

  void resetStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();

    });
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
      inicia+=1;
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    fetchUserSteps();
    //inicia+=bajarlo;

    if (!mounted) return;
  }


  @override
  Widget build(BuildContext context) {

    Permission.activityRecognition.request();


    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    //inicia+=bajarlo;



    return MaterialApp(
      home: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        appBar: AppBar(
          title: const Text('Walking Points'),
          backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        ),
        body: WillPopScope(
          onWillPop: _onBackPressed, // Asigna la función que se ejecutará al presionar el botón de retroceso.
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Steps Taken',
                style: TextStyle(color: isDarkMode ? tPrimaryColor : tSecondaryColor, fontSize: 30),
              ),
              FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel user = snapshot.data as UserModel;

                      //Controllers
                      final email = TextEditingController(text: user.email);
                      final password =
                      TextEditingController(text: user.password);
                      final fullName =
                      TextEditingController(text: user.fullName);
                      final phoneNo = TextEditingController(text: user.phoneNo);
                      if (inicia==1){
                        inicia +=user.steps;
                      }

                      final userData = UserModel(
                          id: user.id,
                          email: email.text.trim(),
                          password: password.text.trim(),
                          fullName: fullName.text.trim(),
                          phoneNo: phoneNo.text.trim(),
                          steps: inicia
                      );

                      controller.updateRecord(userData);





                      return Column(
                        children: [
                          /// -- IMAGE with ICON
                          const SizedBox(height: 50),
                          Text(inicia.toString(),
                            style: TextStyle(color: isDarkMode ? tPrimaryColor : tSecondaryColor,fontSize: 60),),
                        ],
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
              Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                'Pedestrian Status',
                style: TextStyle(color: isDarkMode ? tPrimaryColor : tSecondaryColor,fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                    ? Icons.accessibility_new
                    : Icons.accessibility_new,
                size: 100,
                color: isDarkMode ? tPrimaryColor : tSecondaryColor,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(color: isDarkMode ? tPrimaryColor : tSecondaryColor,fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
              Center(
                child: _isConnected
                    ? Text(' ')
                    : Text('No hay conexión a Internet', style: TextStyle(color: isDarkMode ? tPrimaryColor : tSecondaryColor,fontSize: 30)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => CuponesView(initialValue: inicia,));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black, minimumSize: Size(40, 40)),
                    child: const Text("Cupones",
                        style: TextStyle(
                            color: Color(0xFFF6A700),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => Ranking());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black, minimumSize: Size(40, 40)),
                    child: const Text("Ranking",
                        style: TextStyle(
                            color: Color(0xFFF6A700),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),

                ],
              ),
            ],
          ),
        ),

      ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
    // Aquí puedes ejecutar tu método o lógica antes de salir de la vista.
    // Puedes realizar acciones como mostrar un diálogo de confirmación o guardar datos.

    // Si quieres bloquear el cierre de la vista, puedes devolver 'false'.
    // Si quieres permitir el cierre de la vista, puedes devolver 'true'.

    // Ejemplo: Mostrar un diálogo de confirmación antes de salir
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('¿Desea salir?'),
          content: Text('¿Está seguro de que desea salir de esta vista?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No cierra la vista.
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Cierra la vista.
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );

    return Future.value(false); // Bloquea el cierre de la vista.
  }
}

