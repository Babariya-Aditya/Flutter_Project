
import 'package:adi_project/Project-1/Screens/Product_List/Components/Body.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List"),centerTitle: true,),

      body: Body(),

    );
  }
}
