import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:stuzonefinal/src/constants/sizes.dart';
import 'package:stuzonefinal/src/constants/text_strings.dart';
import '../../../controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String otp = '';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              tOtpTitle,
              ),
            Text("VERIFICA TU CELULAR", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 40.0),
            const Text("COLOCA EL CODIGO AQUI: ", textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                }),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTP(otp);
                  },
                  child: const Text(tNext)),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPScreenClone extends StatelessWidget {
  const OTPScreenClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String otp = '';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              tOtpTitle,
            ),
            Text("VERIFICA TU CELULAR", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 40.0),
            const Text("COLOCA EL CODIGO AQUI: ", textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  OTPController.instance.verifyOTPClone(otp);
                }),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTPClone(otp);
                  },
                  child: const Text(tNext)),
            ),
          ],
        ),
      ),
    );
  }
}
