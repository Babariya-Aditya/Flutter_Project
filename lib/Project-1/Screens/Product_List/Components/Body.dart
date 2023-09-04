import 'dart:io';

import 'package:adi_project/Project-1/DataBase/dbHelper.dart';
import 'package:adi_project/Project-1/Modal/category.dart';
import 'package:adi_project/Project-1/Screens/Category/Components/Category_Screen.dart';
import 'package:adi_project/Project-1/Screens/Category_List/Components/Category_List.dart';
import 'package:adi_project/Project-1/Screens/Product/Components/Product_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  Category? category;


  Body([this.category]);

  @override
  State<Body> createState() => _BodyState(this.category);
}

class _BodyState extends State<Body> {
  Category? category;

  _BodyState([this.category]);

  var categoryList = <Category>[];
  Db_helper _db_helper = Db_helper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var category = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdcutScreen(),
              ),
            );
            if (category is Category) {
              setState(() {
                categoryList.add(category);
              });
            }
          },
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Are you sure"),
                          actions: [
                            TextButton(onPressed: () {
                              setState(() {
                                delete(category!);
                              });


                            }, child: Text("Delete"),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red))),
                            TextButton(onPressed: () {}, child: Text("Cancel"))
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey.shade800,
                  )),
              onTap: () async {
                var category = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryScreen(categoryList: categoryList[index]),
                    ));
                // print(category._title);
                if (category is Category) {
                  var index = categoryList
                      .indexWhere((element) => element.id == category.id);
                  setState(() {
                    categoryList[index] = category;
                  });
                }
              },
              leading:
                  CircleAvatar(radius: 35, child: SvgPicture.file(
             File('${categoryList[index].imagePath}'),
            height: 25,
            ),),
              title: Text(categoryList[index].title!),
              subtitle: Text(categoryList[index].description!),
            );
          },
        ));
  }

  getCategoryList() async {
    var list = await _db_helper.getCategoryList();
    setState(() {
      categoryList = list;
    });
  }
  Future<int> delete(Category category) async {
     int id = await _db_helper.delete(category.id!);
     return id;
  }

  }



