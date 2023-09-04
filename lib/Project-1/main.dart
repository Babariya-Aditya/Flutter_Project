import 'package:adi_project/Project-1/Screens/MainScreens/Splash-Screen.dart';
import 'package:adi_project/Project-1/preferences/prefutils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Login-Page.dart';
import 'Screens/onboarding/on_boarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  PrefUtils.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.black)),
            enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black),
                gapPadding: 5),
          hintStyle: TextStyle(color: Colors.black)
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(centerTitle: true,),
        primarySwatch: Colors.indigo,
      ),
      home: Splash(),
    );
  }
}


