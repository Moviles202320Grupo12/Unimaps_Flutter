
import 'package:flutter/material.dart';
import 'dart:async';

 int count = 0;
class AppLifecycleReactorState extends StatefulWidget{
  const AppLifecycleReactorState({super.key});

  @override
  _AppLifecycleReactorState createState()=>_AppLifecycleReactorState();

}

class _AppLifecycleReactorState extends State<AppLifecycleReactorState> with WidgetsBindingObserver{
  late Timer timer;
  bool active=true;
  
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timer=Timer.periodic(const Duration(seconds: 1), (tm) { 
     if(active){
       setState(() {
        count+=1;
      });
     }
    });
  }

  @override
  void dispose(){
    super.dispose();
    timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state==AppLifecycleState.resumed){active=true;print("resumed");}
    else if(state==AppLifecycleState.inactive){active=false;print("inactive");}
    else if(state==AppLifecycleState.detached){print("detached");}
    else if(state==AppLifecycleState.paused){active=false;print("paused");}
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text("El tiempo transcurrido en Stuzone es de $count segundos", style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      
    );
  }
}  
