import 'package:app_final/pages/inicio_crear_sesion.dart';
//import 'package:app_final/pages/land_page.dart';
//import 'package:app_final/pages/lost_property.dart';
//import 'package:app_final/pages/create_lost_property.dart';
import 'package:app_final/pages/find_lost_property.dart';
import 'package:app_final/pages/registro.dart';
import 'package:app_final/pages/login_page.dart';
import 'package:flutter/material.dart';
//import 'pages/login_page.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MealGoal',
        theme: ThemeData(
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontFamily: 'Urbanist',
                ),
                bodyMedium: TextStyle(
                  fontFamily: 'Urbanist',
                ))),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: InicioCrearSesion(),
        ));
  }
}
