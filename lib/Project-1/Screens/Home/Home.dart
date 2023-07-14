import 'package:adi_project/Project-1/Screens/Home/Components/HomeScreenDrawer.dart';
import 'package:adi_project/Project-1/Screens/Home/Components/SignUp-User-Data/UserData.dart';
import 'package:adi_project/Project-1/Screens/Home/Components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  //HomeScreen(String email, String firstName);


  //const HomeScreen(Type userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),

      body: Body(),

    );
  }
}

