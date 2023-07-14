import 'dart:async';

import 'package:adi_project/Project-1/Screens/Home/Home.dart';
import 'package:adi_project/Project-1/Screens/Sign_in/Sigin_Screen.dart';
import 'package:adi_project/Project-1/Screens/onboarding/on_boarding.dart';
import 'package:adi_project/Project-1/preferences/prefutils.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
     if(PrefUtils.getLoginStatus()){
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => HomeScreen()));
     }
     else if(PrefUtils.getOnboardingstatus()){
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => SiginForm()));
     }
     else{
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => onboarding()));
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(gradient: RadialGradient(
                colors: [Colors.white, Colors.deepPurpleAccent])),
            child: Image.asset(
              'assets/images/Splash.png', fit: BoxFit.contain,)),
      ),
    );
  }
}
