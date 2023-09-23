import 'package:app_final/pages/land_page.dart';
import 'package:app_final/pages/lost_property.dart';
import 'package:app_final/pages/create_lost_property.dart';
import 'package:app_final/pages/find_lost_property.dart';
import 'package:app_final/pages/registro.dart';
import 'package:app_final/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginPage(), // Pantalla de inicio
        '/lost_property.dart': (context) =>
            FindLostProperty(),
        '/pages/registro.dart': (context) =>
            RegisterPage(),
        '/pages/login_page.dart': (context) =>
            LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                fontFamily: 'Urbanist',
              ),
              bodyText2: TextStyle(
                fontFamily: 'Urbanist',
              ))),
    );
  }
}
