
import 'package:adi_project/Project-1/Screens/Home/Home.dart';
import 'package:adi_project/Project-1/Utils/utils.dart';
import 'package:adi_project/Project-1/preferences/prefutils.dart';
import 'package:flutter/material.dart';

class Sigin extends StatefulWidget {

  @override
  State<Sigin> createState() => _SiginState();
}

class _SiginState extends State<Sigin> {
  var EmailController=TextEditingController();
  var PasswordController=TextEditingController();

   var PasswordError = null;

  var EmailError = null;


  LoginButton() {
    return MaterialButton(

      height: 50,
       color: Colors.deepPurpleAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal:20,vertical: 16),

      onPressed: () {
        String email=EmailController.text.toString().trim();
        String password=PasswordController.text.toString().trim();
        resetFocus();
        if(email.isEmpty||!Utils.isvalidEmail(email)){
          setState(() {
            EmailError='Enter a valid email';
          });

        }
        else
        if(password.isEmpty||!Utils.isvalidPassword(password)){
          setState(() {
            PasswordError='Enter a valid Password';
          });

        }
        else{
          PrefUtils.UpdateLoginStatus(true).then((value) {
            if(value){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
            }
          });

          }


        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));


      },
      child: Text(
        "Login ",
        style: TextStyle(fontSize: 22,color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var EmailController=TextEditingController();
    var PasswordController=TextEditingController();
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmailFormField(),
        SizedBox(
          height: 28,
        ),
        PasswordFormField(),
        SizedBox(
          height: 10,
        ),
        ForgotButton(),
        SizedBox(
          height: 28,
        ),
        LoginButton()
      ],
    ));

  }

  EmailFormField() {
    return TextFormField(
      controller: EmailController,
      decoration: InputDecoration(
        errorText: EmailError,
        suffixIcon: Icon(Icons.email, color: Colors.black),
        labelText: "Email",
        hintText: "Enter Email",
      ),
    );
  }

  PasswordFormField() {

    return TextFormField(
      controller: PasswordController,
      decoration: InputDecoration(
        errorText: PasswordError,
        suffixIcon: Icon(Icons.remove_red_eye, color: Colors.black),
        labelText: "Password",
        hintText: "Enter Password",
      ),
    );

  }

  ForgotButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ))
      ],
    );
  }

  void resetFocus() {
    PasswordError=null;
    EmailError=null;
  }
}
