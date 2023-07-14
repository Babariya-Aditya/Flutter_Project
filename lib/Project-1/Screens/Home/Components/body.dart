import 'package:adi_project/Project-1/Screens/Home/Components/Header.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
           Header()
          ],
        ),
      ),
    );
  }
}
