import 'package:app_final/pages/lost_property.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(LostProperty());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData.light().copyWith(
          textTheme:
              GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme)),
    );
  }
}
