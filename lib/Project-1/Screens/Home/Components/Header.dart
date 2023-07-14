import 'package:adi_project/Project-1/Components/RoundedIcon.dart';
import 'package:adi_project/Project-1/Components/Search_Field.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedIcon(
          onpress: () {
            Scaffold.of(context).openDrawer();
          },
          color: Colors.indigo,
          icondata: Icons.menu,
          sizes: 35,
        ),
        SearchField(),

        RoundedIcon(
          onpress: () {},
          color: Colors.indigo,
          icondata: Icons.shopping_cart,
          sizes: 30,
        ),
      ],
    );
  }
}
