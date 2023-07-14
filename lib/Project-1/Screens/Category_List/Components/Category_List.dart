import 'package:adi_project/Project-1/Screens/Category/Components/Category_Screen.dart';
import 'package:adi_project/Project-1/Screens/Category_List/Components/Body.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category List"),centerTitle: true,),

      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(),));
      },backgroundColor: Colors.indigo,child: Icon(Icons.add),),
      body: Body(),

    );
  }
}
