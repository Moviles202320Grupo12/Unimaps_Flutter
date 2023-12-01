import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/firebase_options.dart';
import 'package:stuzonefinal/src/features/authentication/screens/login/widgets/inicio_crear_sesion.dart';
import 'package:stuzonefinal/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:stuzonefinal/src/repository/authentication_repository/authentication_repository.dart';
import 'package:stuzonefinal/src/repository/coupon_repository/coupon_repository.dart';
import 'package:stuzonefinal/src/repository/lost_repository/found_repository.dart';
import 'package:stuzonefinal/src/repository/lost_repository/lost_repository.dart';
import 'package:stuzonefinal/src/repository/lost_repository/time_reg_lostpropRepo.dart';
import 'package:stuzonefinal/src/repository/tutor_repository/tutor_repository.dart';
import 'package:stuzonefinal/src/repository/event_repository/event_repository.dart';
import 'package:stuzonefinal/src/utils/app_bindings.dart';
import 'package:stuzonefinal/src/utils/theme/theme.dart';
import 'dart:async';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  var device = DeviceInfoPlugin();
 // Check the operating system
   if (Platform.isAndroid) {
     print('Android');
   } else if (Platform.isIOS) {
     print('iOS');
   } else if (Platform.isMacOS) {
     print('macOS');
   } else if (Platform.isWindows) {
     print('Windows');
   } else if (Platform.isLinux) {
     print('Linux');
   } else {
     print('Unknown operating system');
   }
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
    Get.put(EventRepository());
    Get.put(LostTimerRepository());
    Get.put(CouponRepository());
    Get.put(FoundRepository());
  });

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding:
            AppBinding(), // Solves the issues of Get.lazyPut and Get.Put() by defining all Controllers in single class
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        //home: const Scaffold(body: Center(child: CircularProgressIndicator())),
        home: LoginPage()

        /// Show Progress Indicator OR SPLASH SCREEN until Screen Loads all its data from cloud.
        /// Let the AuthenticationRepository decide which screen to appear as first.
        );
  }
}


class AppLifecycleReactorState extends StatefulWidget{
  @override
  _AppLifecycleReactorState createState()=>_AppLifecycleReactorState();

}

class _AppLifecycleReactorState extends State<AppLifecycleReactorState> with WidgetsBindingObserver{
  late Timer timer;
  int count=0;
  bool active=true;
  
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timer=Timer.periodic(Duration(seconds: 1), (tm) { 
     if(active){
       setState(() {
        count+=1;
      });
     }
    });
  }

  @override
  void dispose(){
    super.dispose();
    timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state==AppLifecycleState.resumed){active=true;print("resumed");}
    else if(state==AppLifecycleState.inactive){active=false;print("inactive");}
    else if(state==AppLifecycleState.detached){print("detached");}
    else if(state==AppLifecycleState.paused){active=false;print("paused");}
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text("$count", style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),),
    );
  }

}