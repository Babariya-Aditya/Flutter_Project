import 'package:adi_project/Project-1/Modal/category.dart';
import 'package:adi_project/Project-1/Screens/Category/Components/Body.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CategoryScreen extends StatelessWidget {
  Category? categoryList;
  CategoryScreen({this.categoryList});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: categoryList == null
              ? Text("Manage Category")
              : Text("Update Category"),
          centerTitle: true),
      body: Body(categoryList),
    );
  }
}
