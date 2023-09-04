
import 'package:adi_project/Project-1/Screens/Product/Components/Body.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProdcutScreen extends StatelessWidget {


  ProdcutScreen();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Add Product"),
          centerTitle: true),
      body: Body(),
    );
  }
}
