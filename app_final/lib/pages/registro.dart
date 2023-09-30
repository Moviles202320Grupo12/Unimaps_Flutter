import 'package:app_final/pages/land_page.dart';
import 'package:flutter/material.dart';
import 'package:app_final/components/my_button.dart';
import 'package:app_final/components/my_textfield.dart';
import 'package:app_final/components/square_tile.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordconfirmerController = TextEditingController();

  // sign user in method
  void register(BuildContext context) {
    Navigator.pushNamed(context,
        '/pages/lost_property.dart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const SquareTile(imagePath: 'lib/imgs/el_logo.png'),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Hola!, registrese para comenzar',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 25),

              // confirmer textfield
              MyTextField(
                controller: passwordconfirmerController,
                hintText: 'Confirm Password',
                obscureText: false,
              ),
              const SizedBox(height: 10),



              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap:  () {
                  // Navegar a la página de detalles al presionar el botón
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LandPage(), // Página de detalles
                      ),
                      );
                  },


              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'lib/imgs/google.png'),

                  SizedBox(width: 20),

                  // outlook button
                  SquareTile(imagePath: 'lib/imgs/outlook_logo.webp'),

                  SizedBox(width: 20),

                  // outlook button
                  SquareTile(imagePath: 'lib/imgs/outlook_logo.webp')
                ],
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
