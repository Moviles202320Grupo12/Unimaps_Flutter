import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';
import 'package:stuzonefinal/src/constants/text_strings.dart';
import 'package:stuzonefinal/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:stuzonefinal/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                Container(
                  width: 340,
                  height: 340,
                  margin: const EdgeInsets.only(top: 80, bottom: 10, left: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(tLogoStuZone)),
                    borderRadius: const BorderRadius.all(Radius.elliptical(60, 60)),
                  ),
                ),

                SignUpFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
