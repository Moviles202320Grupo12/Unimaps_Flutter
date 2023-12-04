import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/authentication/controllers/signup_controller.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../core/controllers/profile_controller.dart';
import '../../core/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'login_controller.dart';
String elnumero= '';
class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  var myNumber = ''.obs; // Usa '.obs' para observar cambios en los datos

  void updateData(String newData) {
    myNumber.value = newData;
    elnumero=newData;// Actualiza el valor observado
  }

  void verifyOTP(String otp) async {
    //elnumero = otp;
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(CompletarUsuario()) : Get.back();
  }

  void verifyOTPClone(String otp) async {
    final controller = Get.put(ProfileController());//elnumero = otp;
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    if (isVerified) {
      UserModel usuario = await controller.getUserByPhone(elnumero);
      // ^ Aquí se espera a que el Future<UserModel> se complete para obtener el UserModel
      if (usuario != null) {
        LoginController.instance.loginUser(usuario.email, usuario.password);
      } else {
        // Manejo si no se encuentra el usuario
      }
      print(usuario.email);
      print(usuario.password);

      LoginController.instance.loginUser(usuario.email, usuario.password);

    } else {
      Get.back();
    }
  }

}


class CompletarUsuario extends StatelessWidget {
  const CompletarUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.fullName,
                      decoration: const InputDecoration(label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope)),
                    ),
                    const SizedBox(height: tFormHeight - 20),

                    TextFormField(
                      controller: controller.password,
                      decoration: const InputDecoration(label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint)),
                    ),
                    const SizedBox(height: tFormHeight - 10),
                    Obx(
                          () => SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    /// Email & Password Authentication
                                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                                    /// For Phone Authentication
                                    // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                                    //Get.to(()=> OTPScreen());

                                    /*
                       =========
                       Todo:Step - 3 [Get User and Pass it to Controller]
                       =========
                      */
                                    final user = UserModel(
                                        email: controller.email.text.trim(),
                                        password: controller.password.text.trim(),
                                        fullName: controller.fullName.text.trim(),
                                        phoneNo: elnumero,
                                        steps: 0
                                    );
                                    SignUpController.instance.createUser(user);
                                  }
                                },
                                child: controller.isLoading.value
                                    ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text("Loading...")
                                  ],
                                )
                                    : Text(tSignup.toUpperCase()),
                              ),
                            ],
                          )

                      ),
                    )
                  ],
                ),
              ),
            ),
            ),
          ),
        ),

    );
  }
}