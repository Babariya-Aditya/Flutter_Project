import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            textInputAction: TextInputAction.search,

            decoration: InputDecoration(

                prefixIcon: Icon(Icons.search,color: Colors.indigo,size: 25),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 12),
                hintText: "Search Product"),


          ),
        ),
      ),
    );
  }
}
