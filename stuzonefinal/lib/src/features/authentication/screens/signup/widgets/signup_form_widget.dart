import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/authentication/controllers/otp_controller.dart';
import 'package:stuzonefinal/src/features/authentication/models/user_model.dart';
import 'package:stuzonefinal/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(false);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
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
              controller: controller.phoneNo,
              decoration: const InputDecoration(label: Text(tPhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone)),
            ),
            const SizedBox(height: tFormHeight - 20),
          Container(
      margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
        child: ValueListenableBuilder<bool>(
          valueListenable: passwordVisible,
          builder: (context, bool isVisible, child) {
            return TextField(
              controller: controller.password,
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
        )),
            const SizedBox(height: tFormHeight - 10),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (controller.fullName.text.length>12)
                          {
                            Get.snackbar(
                              "OJO",
                              "Ese nombre esta como larguito -_-",
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 3),
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        else if (controller.email.text.length>30)
                        {
                          Get.snackbar(
                            "OJO",
                            "Ese correo esta como larguito -_-",
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                        else if (formKey.currentState!.validate()) {
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
                              phoneNo: controller.phoneNo.text.trim(),
                              steps: 0
                          );
                          SignUpController.instance.createUser(user);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
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
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          /// Email & Password Authentication
                          // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                          /// For Phone Authentication

                          Get.to(()=> RegistroConCelular());


                          /*
                       =========
                       Todo:Step - 3 [Get User and Pass it to Controller]
                       =========
                      */

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
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
                          : Text("¡NEW! Con celular"),

                    ),
                  ],
                )

              ),
            )
          ],
        ),
      ),
    );
  }
}


class RegistroConCelular extends StatefulWidget {
  const RegistroConCelular({Key? key}) : super(key: key);

  @override
  State<RegistroConCelular> createState() => _RegistroConCelular();
}


class _RegistroConCelular  extends State<RegistroConCelular> {


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
            labelText: 'Ingresa: +573125556677',
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

              Get.to(()=> OTPScreen());
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

}
