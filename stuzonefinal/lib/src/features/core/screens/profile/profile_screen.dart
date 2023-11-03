import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/constants/sizes.dart';
import 'package:stuzonefinal/src/constants/text_strings.dart';
import 'package:stuzonefinal/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:stuzonefinal/src/features/core/screens/profile/widgets/image_with_icon.dart';
import 'package:stuzonefinal/src/features/core/screens/profile/widgets/profile_menu.dart';

import 'package:stuzonefinal/src/features/authentication/models/user_model.dart';
import 'package:stuzonefinal/src/features/core/controllers/profile_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../authentication/screens/welcome/welcome_screen.dart';
import 'all_users.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    //var instanciaDeMiClase = AuthenticationRepository();
    //String email = instanciaDeMiClase.getUserEmail;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title:
        Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel user = snapshot.data as UserModel;

                      //Controllers
                      final email = TextEditingController(text: user.email);
                      final password =
                      TextEditingController(text: user.password);
                      final fullName =
                      TextEditingController(text: user.fullName);
                      final phoneNo = TextEditingController(text: user.phoneNo);

                      return Column(
                        children: [
                          /// -- IMAGE with ICON
                          const ImageWithIcon(),
                          const SizedBox(height: 50),
                          Text(user.email,
                              style:
                              Theme.of(context).textTheme.headlineMedium),
                          Text(user.fullName,
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(tEditProfile,
                      style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Settings",
                  icon: LineAwesomeIcons.cog,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Billing Details",
                  icon: LineAwesomeIcons.wallet,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () => Get.to(AllUsers())),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            AuthenticationRepository.instance.logout();
                            Get.to(() => const WelcomeScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
