import 'package:app_final/pages/inicio_crear_sesion.dart';
import 'package:app_final/pages/map.dart';
import 'package:flutter/material.dart';

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
        home: const Scaffold(
          body: Map(),
        ));
  }
}
