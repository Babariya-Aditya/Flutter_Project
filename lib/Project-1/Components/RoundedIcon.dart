import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  IconData icondata;
  double sizes;
  Color color;
  VoidCallback onpress;

  RoundedIcon(
      {required this.icondata,
      required this.sizes,
      required this.color,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: MaterialButton(padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          onPressed: onpress,
          color: Colors.white,
          child: Icon(icondata, color: color,),
        ));
  }
}
