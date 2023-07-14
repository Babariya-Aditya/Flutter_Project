import 'package:adi_project/Project-1/Screens/Category/Components/Body.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Category"),centerTitle: true),
      body: Body(),
    );
  }
}
