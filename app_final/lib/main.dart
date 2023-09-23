import 'package:app_final/pages/lost_property.dart';
import 'package:app_final/pages/find_lost_property.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LostProperty(),
        '/pages/lost_property': (context) => FindLostProperty(),
      },
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LostProperty(), // Pantalla de inicio
        '/lost_property.dart': (context) =>
            FindLostProperty(), // Tu pantalla LostProperty
      },
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
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
