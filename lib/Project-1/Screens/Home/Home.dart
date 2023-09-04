import 'package:adi_project/Project-1/Screens/Home/Components/HomeScreenDrawer.dart';
import 'package:adi_project/Project-1/Screens/Home/Components/SignUp-User-Data/UserData.dart';
import 'package:adi_project/Project-1/Screens/Home/Components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String? firstName,email;
  HomeScreen({this.firstName,this.email});
 @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(firstName,email),

      body: Body(),

    );
  }
}

