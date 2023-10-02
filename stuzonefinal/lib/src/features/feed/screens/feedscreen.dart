import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuzonefinal/src/constants/sizes.dart';
import 'package:stuzonefinal/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:stuzonefinal/src/constants/colors.dart';
import 'package:stuzonefinal/src/constants/image_strings.dart';
import 'package:stuzonefinal/src/constants/text_strings.dart';
import 'package:stuzonefinal/src/utils/animations/fade_in_animation/animation_design.dart';
import 'package:stuzonefinal/src/utils/animations/fade_in_animation/fade_in_animation_controller.dart';
import 'package:stuzonefinal/src/utils/animations/fade_in_animation/fade_in_animation_model.dart';
import 'package:stuzonefinal/src/features/authentication/screens/login/login_screen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body:  SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [

                        const SizedBox(width: 20.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: Text(fLostButton),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: Text(fWalkingButton),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: Text(fEventsButton),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: Text(fTutorsButton),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
        ),

    );
  }
}
