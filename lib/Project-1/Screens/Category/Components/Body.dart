import 'dart:io';

import 'package:adi_project/Project-1/DataBase/dbHelper.dart';
import 'package:adi_project/Project-1/Modal/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Body extends StatefulWidget {
  Category? category;

  Body(this.category);

  @override
  State<Body> createState() => _BodyState(this.category);
}

class _BodyState extends State<Body> {
  Category? category;

  _BodyState(this.category);

  final titleController = TextEditingController();
  final descController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  Db_helper _db_helper = Db_helper();
  File? imageFile;

  Future<void> buildImageFromGallery() async {
    var tempFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (tempFile != null) {
      var file = File(tempFile.path);
      var imagefile=basename(tempFile.path);
      print("$imagefile");
      print(file);
      setState(() {
        imageFile = file;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (category != null) {
      titleController.text = category!.title ?? '';
      descController.text = category!.description ?? '';
      imageFile=File(category!.imagePath!);
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
                  onTap: () async {
                    buildImageFromGallery();
                   //  Directory tempdir= await getTemporaryDirectory();
                   //  print('tempdirectory : ${tempdir}');
                   //
                   //  Directory appdocdir= await getApplicationDocumentsDirectory();
                   //  print('appdocDirectory : ${appdocdir}');
                   //
                   //  Directory supportdir= await getApplicationSupportDirectory();
                   //  print('supportdir : ${supportdir}');
                  },
                  child: CircleAvatar(

                      // backgroundImage: ImageSetter != null
                      //     ? FileImage(ImageSetter!)
                      //     : AssetImage("assets/images/categories.png") as ImageProvider,
                      child: imageFile != null
                          ? SvgPicture.file(
                              imageFile!,
                              height: 55,
                            )
                          : Icon(
                              Icons.camera_alt,
                              size: 55,
                            ),
                      radius: 60,
                      backgroundColor: Colors.indigo.shade800),
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
                buildAddCategoryButtonWidget(context),
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
      controller: titleController,
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

  buildAddCategoryButtonWidget(BuildContext context) {
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
        if(imageFile!=null){
          var path= await saveImage(imageFile!);

          if(path!=null){
            if (category == null) {
              Category category = Category(title: _title, description: _desc,imagePath: path);
              addCategory(category, context);
            } else {
              print(_desc);
              print(_title);
              Category cat = Category.withId(
                  description: _desc,
                  title: _title,
                  id: category!.id,
                  date: category!.date,imagePath: path);
              UpdateCategory(cat, context);
            }
          }
          }
      },
      child: Text(
        category == null ? 'Add Category' : 'Update Category',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> addCategory(Category category, BuildContext context) async {
    int? id = await _db_helper.insert(category);
    if (id != -1) {
      print("Category added Successfully");
      category.id = id;
      Navigator.pop(context, category);
    } else {
      print('Getting error');
    }
  }

  Future<void> UpdateCategory(Category cat, BuildContext context) async {
    int? id = await _db_helper.update(cat);
    if (id != -1) {
      print("Category Updated Successfully");
      Navigator.pop(context, cat);
    } else {
      print('Getting error');
    }
  }

  Future<String> saveImage(File imageFile) async {
    Directory root= await getApplicationSupportDirectory();
    String fileName='${DateTime.now().microsecondsSinceEpoch}.svg';
    String name=basename(imageFile.path);
    print(name);
    String FileExist=join(root.path,name);
    File mfile=File(FileExist);
    if(mfile.exists()==false){
      print(root.path);
      print("file Created");
      print(fileName);
      var path=await join(root.path,fileName);
      File file=await imageFile.copy(path);
      return file.path;
    }
    return imageFile.path;

  }
}
