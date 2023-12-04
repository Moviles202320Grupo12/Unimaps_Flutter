import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/constants/sizes.dart';
import 'package:stuzonefinal/src/features/core/screens/dashboard/widgets/appbar.dart';

import 'package:get/get.dart';

import 'package:stuzonefinal/src/features/feed/controllers/feedcontroller.dart';


import '../../../lostproperty/screens/found_property.dart';
import '../../../lostproperty/screens/lost_property.dart';
import '../../../maps/intentoDos/pages/maps_v1_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness ==
        Brightness.dark; //Dark mode

    final FeedController controller = FeedController();

    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(
          isDark: isDark,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,

                    child: ElevatedButton(
                      //onPressed: () => controller.buttonPressed(0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapsV1Page()), // Navega a HomeMap
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
                      child: Text(controller.buttons[0].name),
                    )),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        _mostrarDialogo(context);
                      },
                      child: Text(controller.buttons[1].name),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 10),
                      ),
                    )),

                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(2),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 10),
                      ),

                      child: Text(controller.buttons[2].name),
                    )
                ),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(3),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 10),
                      ),
                      child: Text(controller.buttons[3].name),
                    )
                ),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(4),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 10),
                      ),
                      child: Text(controller.buttons[4].name),

                    )),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(5),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),

                      child: Text(controller.buttons[5].name),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lost Property'),
          content: const Text('Welcome to the wonderful world of lost things. What do you want to do today?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.to(() => const LostProperty());
              },
              child: const Text('See Found Things'),
            ),
            TextButton(
              onPressed: () {
                // Acción al presionar el segundo botón del diálogo
                print('Segundo botón presionado');
                Get.to(() => const FoundProperty());
                //Get.to(() => PruebaDeMierda());
              },
              child: const Text('See Lost Things'),
            ),
          ],
        );
      },
    );
  }
}
