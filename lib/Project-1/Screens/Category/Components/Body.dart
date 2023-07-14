
import 'dart:io';

import 'package:adi_project/Project-1/DataBase/dbHelper.dart';
import 'package:adi_project/Project-1/Modal/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final titleController = TextEditingController();
  final descController = TextEditingController();




  ImagePicker imagePicker = ImagePicker();
  Db_helper _db_helper=Db_helper();
  File? ImageSetter;

  Future<void> buildImageFromGallery() async {
    var tempFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (tempFile != null) {
      var file = File(tempFile.path);
      print(file);
      setState(() {
        ImageSetter = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    buildImageFromGallery();
                  },
                  child: CircleAvatar(
                    backgroundImage: ImageSetter != null
                        ? FileImage(ImageSetter!)
                        : AssetImage("assets/images/categories.png") as ImageProvider,
                    radius: 60,
                    backgroundColor: Colors.grey.withOpacity(.30),

                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                buildTitleFormField(),
                SizedBox(
                  height: 16,
                ),
                buildDescriptionFormField(),
                SizedBox(
                  height: 24,
                ),
                buildAddCategoryButtonWidget(),
                SizedBox(
                  height: 24,
                ),
              ],
            )),
      ),
    );
  }

  buildTitleFormField() {
    return TextFormField(
      controller: titleController ,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Category",
        hintText: 'Category Name',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildDescriptionFormField() {
    return TextFormField(
      controller: descController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Description",
        hintText: 'Description',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildAddCategoryButtonWidget() {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () async {
        String _title = titleController.text.toString().trim();
        String _desc = descController.text.toString().trim();
       Category category=Category(title: _title, description: _desc);
       addCategory(category);






      },
      child: Text(
        'Add Category',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void > addCategory(Category category) async {
    int? id = await _db_helper.insertDatabase(category);
    if(id != -1){
      print("Category added Successfully");
    } else{
      print('Getting error');
    }
  }
}
