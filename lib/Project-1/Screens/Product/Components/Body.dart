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
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Category> categoryList = [];

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  getCategoryList() async {
    var list = await _db_helper.getCategoryList();
    setState(() {
      categoryList = list;
    });
  }

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController(text: '0.0');
  final DiscountController = TextEditingController(text: '0');
  int CategoryId = -1;

  ImagePicker imagePicker = ImagePicker();
  Db_helper _db_helper = Db_helper();
  File? imageFile;

  buildCategoryTypeFormField() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null) {
          return 'Select user type';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {},
      decoration: InputDecoration(
          labelText: "User Type",
          hintText: 'Select User Type',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: categoryList.map((category) {
        return DropdownMenuItem(
            value: category.id, child: Text('${category.title}'));
      }).toList(),
      onChanged: (value) {
        CategoryId = value!;
      },
    );
  }

  Future<void> buildImageFromGallery() async {
    var tempFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (tempFile != null) {
      var file = File(tempFile.path);
      print(file);
      setState(() {
        imageFile = file;
      });
    }
  }

  buildPriceformField() {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: priceController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Price';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "price",
            labelText: "Enter Price",
          ),
        )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: TextFormField(
          controller: DiscountController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Discount';
            } else {
              return null;
            }
          },
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: "Discount",
            labelText: "Enter Discount",
          ),
        )),
      ],
    );
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
                    child: CircleAvatar(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 55,
                        ),
                        radius: 60,
                        backgroundColor: Colors.indigo.shade500),
                    onTap: () async {
                      buildImageFromGallery();
                    }),
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
                buildCategoryTypeFormField(),
                SizedBox(
                  height: 24,
                ),
                buildPriceformField(),
                SizedBox(
                  height: 24,
                ),
                buildAddProductButtonWidget(context),
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
        labelText: "Product",
        hintText: 'Product Name',
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

  buildAddProductButtonWidget(BuildContext context) {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () async {
        String Title = titleController.text.toString().trim();
        String Description = descController.text.toString().trim();
        double Price = priceController.text.toString().trim().isEmpty
            ? 0.0
            : double.parse(priceController.text.toString().trim());
        int Discount = DiscountController.text.toString().trim().isEmpty
            ? 0
            : int.parse(DiscountController.text.toString().trim());
        print("${Title}${Description}${Price}${Discount}${CategoryId}");
      },
      child: Text(
        'Add Product',
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
    Directory root = await getApplicationSupportDirectory();
    String fileName = '${DateTime.now().microsecondsSinceEpoch}.svg';
    print(root.path);
    print(fileName);
    var path = await join(root.path, fileName);
    File file = await imageFile.copy(path);
    return file.path;
  }
}
