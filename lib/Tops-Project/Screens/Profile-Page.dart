import 'package:flutter/material.dart';
class ProfilePagee extends StatelessWidget {

  TextFormField getFormField({String? label,String? Hint,IconData? iconData,double? size,double? edge}){
    return TextFormField(obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(edge!
              )),
          labelText: label,
          labelStyle: TextStyle(fontSize: size),
          suffixIcon: Icon(iconData,size: 30,color: Colors.grey,)),
    );
  }



  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Row(
            children: [
              IconButton(onPressed: () {

              }, icon: Icon(Icons.arrow_back_ios_new_sharp,size: 25,)),
              SizedBox(width: size.width*.15 ,),
              Text("Update Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
            ],
          ),
          SizedBox(height: size.width*.08,),
          Image.asset('assets/images/profile (3).png'),
          SizedBox(height: size.width*.04,),
          Text("Upadate your profile from here",style: TextStyle(fontSize: 18),),
          SizedBox(width: size.width*.09 ,),



        ]),
      )),
    );
  }
}


