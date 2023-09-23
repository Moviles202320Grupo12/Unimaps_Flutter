import 'package:app_final/components/register_button.dart';
import 'package:flutter/material.dart';
import 'package:app_final/components/my_button.dart';
import 'package:app_final/components/my_textfield.dart';
import 'package:app_final/components/square_tile.dart';

class LandPage extends StatelessWidget {
  LandPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

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
                'Bienvenido',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),


              const SizedBox(height: 10),


              const SizedBox(height: 10),
              RegisterButton(
                onTap: () {
                  Navigator.pop(context,
                      '/pages/login_page.dart'); // Regresar a la ventana anterior
                },
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                  onTap: () {
                    Navigator.pop(context,
                        '/pages/registro.dart'); // Regresar a la ventana anterior
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
            ],
          ),
        ),
      ),
    );
  }
}
