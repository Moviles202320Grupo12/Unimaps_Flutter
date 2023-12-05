import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/features/core/screens/map.dart';
import 'package:flutter/foundation.dart';
import 'package:stuzonefinal/src/features/authentication/controllers/login_controller.dart';
import 'package:stuzonefinal/src/features/authentication/screens/forget_password/olvidocontrasena.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/animations/fade_in_animation/animation_design.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../utils/animations/fade_in_animation/fade_in_animation_model.dart';
import '../../controllers/otp_controller.dart';
import '../../controllers/signup_controller.dart';
import '../forget_password/forget_password_otp/otp_screen.dart';
import '../login/login_screen.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

// LoginScreen
// SignUpScreen


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}


class _LoginPage  extends State<LoginPage> {



  late ConnectivityResult _connectionStatus;
  // Variables

  // Biometric auth
  final LocalAuthentication auth = LocalAuthentication();
  bool isBiometricAvailable = false;
  bool isDeviceSupported = false;

  final FlutterNetworkConnectivity _flutterNetworkConnectivity =
  FlutterNetworkConnectivity(
    isContinousLookUp: true,
    // optional, false if you cont want continous lookup
    lookUpDuration: const Duration(seconds: 5),
    // optional, to override default lookup duration
    lookUpUrl: 'example.com', // optional, to override default lookup url
  );

  bool? _isInternetAvailableOnCall;

  bool? _isInternetAvailableStreamStatus;

  StreamSubscription<bool>? _networkConnectionStream;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    // Suscripción a los cambios de conectividad
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });
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
            title: const Text('Sin conexión'),
            content: const Text('No tienes conexión a internet, la informacion mostrada puede estar desactualizada.'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Cerrar'),
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


    }
  }


  @override
  void dispose() async {
    _networkConnectionStream?.cancel();
    _flutterNetworkConnectivity.unregisterAvailabilityListener();

    super.dispose();
  }

  void init() async {
    await _flutterNetworkConnectivity.registerAvailabilityListener();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _checkInternetAvailability() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      _isInternetAvailableOnCall =
      await _flutterNetworkConnectivity.isInternetConnectionAvailable();
    } on PlatformException {
      _isInternetAvailableOnCall = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }
  

  // ignore: non_constant_identifier_names
  String path_image = tLogoStuZone;
  String path_google = tGoogleLogoImage;
  String path_outlook = tLogoOutlook;
  String path_huella = tHuella;
  // Change to ValueNotifier
  final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(false);
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // firebase 
  
  //LoginPage({super.key});

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
    final texto = Container(
        height: 130,
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(
          top: 80,
          left: 20,
          right: 20,
        ),
        child: const Text(
          'Que bueno verte de nuevo !',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ));

  final putaFunciona = Container(
      height: 130,
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(
        top: 80,
        left: 20,
        right: 20,
      ),
      child: Center(
        child: _isConnected
            ? const Text('Que bueno verte de nuevo !',
            style: TextStyle(
            color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,)
            : const Text('No hay conexión a Internet, regresa mas tarde!',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,),
      ));


    final ingresarCorreo = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: usernameController,
        obscureText: false,
        decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Ingresa tu correo uniandes',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    final ingresarContrasena = Container(
        margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
        child: ValueListenableBuilder<bool>(
          valueListenable: passwordVisible,
          builder: (context, bool isVisible, child) {
            return TextField(
              controller: passwordController,
              obscureText: !isVisible,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xbbbbbf7f8f9),
                border: const OutlineInputBorder(),
                labelText: 'Ingresa tu contraseña',
                labelStyle: const TextStyle(color: Colors.black45),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Cambiar el ícono según el estado de la visibilidad
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    // Cambiar el estado de la visibilidad
                    passwordVisible.value = !isVisible;
                  },
                ),
              ),
            );
          },
        ));



    final ingresar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SizedBox(
        width: double.infinity, // Expand the button
        height: 65.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          onPressed: () {
            String email = usernameController.text.trim();
            String password = passwordController.text.trim();

            if (email.isEmpty || password.isEmpty) {
              Get.snackbar(
                "Ops ! ",
                "Por favor ingrese un correo y contraseña validos",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else {
              // enviar al back las credenciales
              LoginController.instance.loginUser(email, password);
            }
          },
          child: const Text(
            'Ingresar',
            style: TextStyle(color: Colors.amber, fontSize: 18),
          ),
        ),
      ),
    );

    final otroIngreso = Container(
        margin: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Divider(
                color: Colors.black12,
                thickness: 2,
                height: 36,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(2.0), // Padding around the text
                  color: Colors
                      .white, // Background color matching the main container
                  child: const Text(
                    "  Ingresar con  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));

    final googleButton = InkWell(
      onTap: () async {
      try {
          UserCredential userCredential = await signInWithGoogle();  
          Navigator.of(context).pushReplacement(MaterialPageRoute( builder: (context) => const Map(),)); 
        
        } catch (error) {
            Get.snackbar(
                "Ops ! ",
                "La autentificación con Google no fue posible",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.red,
            );
          print(error);
          // Considera mostrar algún mensaje de error al usuario
        }
         },
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path_google)),
          borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
          shape: BoxShape.rectangle,
        ),
      ),
    );




    final ingresarPhone = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SizedBox(
        width: double.infinity, // Expand the button
        height: 65.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          onPressed: () {
            Get.to(() => LoginConCelular());
          },
          child: const Text(
            'Ingresa Con tu Celular',
            style: TextStyle(color: Colors.amber, fontSize: 18),
          ),
        ),
      ),
    );



    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          putaFunciona,
          ingresarCorreo,
          ingresarContrasena,
          ingresar,
          ingresarPhone,
        ]));
  }
}

class LoginConCelular extends StatefulWidget {
  const LoginConCelular({Key? key}) : super(key: key);

  @override
  State<LoginConCelular> createState() => _LoginConCelular();
}


class _LoginConCelular  extends State<LoginConCelular> {

  StreamSubscription<bool>? _networkConnectionStream;
  bool _isConnected = true;
  late ConnectivityResult _connectionStatus;
  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    // Suscripción a los cambios de conectividad
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    });
  }

  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ingresarPhone = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: phoneController,
        obscureText: false,
        decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xbbbbbf7f8f9),
            border: OutlineInputBorder(),
            labelText: 'Ingresa tu celular',
            labelStyle: TextStyle(color: Colors.black45),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black))),
      ),
    );

    const cajita = SizedBox(
      height: 200,
    );

    final ingresar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SizedBox(
        width: double.infinity, // Expand the button
        height: 65.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          onPressed: () {
            String celular = phoneController.text.trim();

            if (celular.isEmpty) {
              Get.snackbar(
                "Ops ! ",
                "Por favor ingrese un celular valido",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            } else {
              // enviar al back las credenciales
              SignUpController.instance.phoneAuthentication(celular);
              OTPController.instance.updateData(celular);

              Get.to(()=> OTPScreenClone());
            }
          },
          child: const Text(
            'Ingresar',
            style: TextStyle(color: Colors.amber, fontSize: 18),
          ),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          cajita,

          ingresarPhone,
          ingresar,
        ]));


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
            title: const Text('Sin conexión'),
            content: const Text('No tienes conexión a internet, la informacion mostrada puede estar desactualizada.'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Cerrar'),
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


    }
  }

}

