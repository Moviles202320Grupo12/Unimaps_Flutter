import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/firebase_options.dart';
import 'package:stuzonefinal/src/repository/authentication_repository/authentication_repository.dart';
import 'package:stuzonefinal/src/repository/lost_repository/lost_repository.dart';
import 'package:stuzonefinal/src/repository/tutor_repository/tutor_repository.dart';
import 'package:stuzonefinal/src/utils/app_bindings.dart';
import 'package:stuzonefinal/src/utils/theme/theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  /// Show Splash Screen till data loads & when loaded call FlutterNativeSplash.remove();
  /// In this case I'm removing it inside AuthenticationRepository() -> onReady() method.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Before running App - Initialize Firebase and after initialization, Call
  /// Authentication Repository so that It can check which screen to show.
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(AuthenticationRepository());
    Get.put(LostRepository());
    Get.put(TutorRepository());

  });


  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(), // Solves the issues of Get.lazyPut and Get.Put() by defining all Controllers in single class
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const Scaffold(body: Center(child: CircularProgressIndicator())),
      /// Show Progress Indicator OR SPLASH SCREEN until Screen Loads all its data from cloud.
      /// Let the AuthenticationRepository decide which screen to appear as first.
    );
  }
}

