import 'package:flutter/material.dart';
import 'pages/tutor_profile.dart';
import 'pages/select_tutor.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SelectTutorPage(),
      home: ProfileScreen(),
    );
  }
}