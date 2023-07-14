import 'package:adi_project/Tops-Project/Main.dart';
import 'package:adi_project/Tops-Project/Screens/Login%20-Page.dart';
import 'package:adi_project/Tops-Project/Screens/Profile-Page.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App',
        home: ProfilePagee(),
    );
  }
}
class Items{
  TextFormField getFormField({String? label,String? Hint,IconData? iconData,double? size,double? edge}){
    return TextFormField(obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(edge!

              )),
          labelText: label,
          labelStyle: TextStyle(fontSize: size),
          suffixIcon: Icon(iconData,size: 30,color: Colors.grey,)),



    );
  }
}





