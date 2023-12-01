import 'package:flutter/material.dart';
import 'package:stuzonefinal/src/constants/sizes.dart';
import 'package:stuzonefinal/src/constants/text_strings.dart';
import 'package:stuzonefinal/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:stuzonefinal/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:stuzonefinal/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:stuzonefinal/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:stuzonefinal/src/features/core/screens/dashboard/widgets/top_courses.dart';
import 'package:stuzonefinal/src/features/feed/screens/feedscreen.dart';
import 'package:stuzonefinal/src/features/core/screens/map.dart';

import 'package:get/get.dart';

import 'package:stuzonefinal/src/features/feed/controllers/feedcontroller.dart';
import 'package:stuzonefinal/src/features/lostproperty/screens/pruebasDeMierda.dart';

import '../../../lostproperty/screens/found_property.dart';
import '../../../lostproperty/screens/lost_property.dart';

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
                //Heading
                Text(tDashboardTitle, style: txtTheme.bodyMedium),
                Text(tDashboardHeading, style: txtTheme.displayMedium),
                const SizedBox(height: tDashboardPadding),

                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(0),
                      child: Text(controller.buttons[0].name),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
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
                        minimumSize: Size(200, 10),
                      ),
                    )),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(2),
                      child: Text(controller.buttons[2].name),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
                    )),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(3),
                      child: Text(controller.buttons[3].name),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
                    )),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(4),
                      child: Text(controller.buttons[4].name),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
                    )),
                const SizedBox(height: 5),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => controller.buttonPressed(5),
                      child: Text(controller.buttons[5].name),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 10),
                      ),
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
          title: Text('Diálogo con dos botones'),
          content: Text('Este es un diálogo con dos botones.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.to(() => LostProperty());
              },
              child: Text('Ver cosas encontradas'),
            ),
            TextButton(
              onPressed: () {
                // Acción al presionar el segundo botón del diálogo
                print('Segundo botón presionado');
                Get.to(() => FoundProperty());
                //Get.to(() => PruebaDeMierda());
              },
              child: Text('Ver cosas Buscadas'),
            ),
          ],
        );
      },
    );
  }
}
