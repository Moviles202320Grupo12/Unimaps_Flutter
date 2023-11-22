import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/authentication/models/user_model.dart';
import 'package:stuzonefinal/src/features/walkingpoints/controllers/walking_controller.dart';

import 'package:connectivity/connectivity.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../utils/database_helper.dart';
class Ranking extends StatefulWidget {
  Ranking({Key? key}) : super(key: key);

  @override
  State<Ranking> createState() => _Ranking();

}

class _Ranking extends State<Ranking>{

  bool _isConnected = true;
  final controller = Get.put(WalkingController());

  @override
  void initState() {
    super.initState();
    // Suscripción a los cambios de conectividad
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
        if (_isConnected==true){
          Future<List<UserModel>> popo = controller.getAllUsersOrdered();
          DatabaseHelper.actualizarbd(popo);

        }
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tPrimaryColor,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left,)),
        title: Text("Users", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Column(
        children:[
              Text("All Users", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20.0),
          Visibility(
              visible: _isConnected == true,
              child: FutureBuilder<List<UserModel>>(
                future: controller.getAllUsersOrdered(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: tPrimaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: const Border(bottom: BorderSide(), top: BorderSide(), left: BorderSide(), right: BorderSide(), )
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: tPrimaryColor,
                                      ),
                                      child: const Icon(LineAwesomeIcons.user_1, color: Colors.black),
                                    ),
                                    title: Text(snapshot.data![index].fullName, style: Theme.of(context).textTheme.headlineMedium,),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].steps.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )),
      Visibility(
        visible: _isConnected == false,
        child: Text(
          'Estas sin internet, los ultimos datos guardados son los siguientes',
          style: TextStyle(fontSize: 24),
        ),),
              Visibility(
                  visible: _isConnected == false,
                  child: Expanded(
                    child: FutureBuilder<List<UserModel>?>(
                      future: DatabaseHelper.getAllUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting){
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError){
                          return Center(child: Text(snapshot.error.toString()));
                        } else if (snapshot.hasData) {
                          if (snapshot.data !=null){
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (c, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        child: ListTile(
                                          leading: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: tPrimaryColor,
                                            ),
                                            child: const Icon(LineAwesomeIcons.user_1, color: Colors.black),
                                          ),
                                          title: Text(snapshot.data![index].fullName, style: Theme.of(context).textTheme.headlineMedium,),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot.data![index].steps.toString()),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  );
                                });
                          }
                        } else if (!snapshot.hasData) {
                             return Center(
                              child: Text('No data available'),
                              );}
                        return Center(
                          child: Text('Something went wrong'),
                        );

                        }
                      ,
                    ),
                  )),

            ],
          ),

    );
  }
}
