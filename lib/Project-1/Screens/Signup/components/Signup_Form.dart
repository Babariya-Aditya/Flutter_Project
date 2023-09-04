import 'dart:math';

import 'package:adi_project/Project-1/Modal/app_User.dart';
import 'package:adi_project/Project-1/Screens/Home/Components/SignUp-User-Data/UserData.dart';
import 'package:adi_project/Project-1/Screens/Home/Home.dart';
import 'package:adi_project/Project-1/Utils/utils.dart';
import 'package:adi_project/Project-1/firebase/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigupForm extends StatefulWidget {
  @override
  State<SigupForm> createState() => _SigupFormState();
}

class _SigupFormState extends State<SigupForm> {
  String gender = " ";
  FirebaseService _service = FirebaseService();
  final _formkey = GlobalKey<FormState>();
  bool passwordview = true;
  String userType = '';
  var dobController = TextEditingController();
  var FirstNameControllerController = TextEditingController();
  var LastNameController = TextEditingController();
  var EmailController = TextEditingController();
  var ContactController = TextEditingController();
  var AdressController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();

  void updateGenderSelection(String selection) {
    setState(() {
      gender = selection;
    });
  }

  String dob = '';
  @override
  void dispose() {
    EmailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildNameformField(),
            SizedBox(
              height: 16,
            ),
            buildEmailFormField(),
            SizedBox(
              height: 16,
            ),
            buildContactFormField(),
            SizedBox(
              height: 16,
            ),
            buildChooseGender(),
            SizedBox(
              height: 16,
            ),
            buildSelecttype(),
            SizedBox(
              height: 16,
            ),
            buildBirthdate(),
            SizedBox(
              height: 16,
            ),
            buildAddress(),
            SizedBox(
              height: 16,
            ),
            buildPassword(),
            SizedBox(
              height: 16,
            ),
            buildConfirmPassword(),
            SizedBox(
              height: 26,
            ),
            buildSignUpButtonWidget(context)
          ],
        ),
      ),
    );
  }

  buildNameformField() {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
              controller: FirstNameControllerController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'First Name ';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "First Name",
                labelText: "First Name",
              ),
            )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: TextFormField(
              controller: LastNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Last Name ';
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Last Name",
                labelText: "Last Name",
              ),
            )),
      ],
    );
  }

  buildEmailFormField() {
    return TextFormField(
      controller: EmailController,
      validator: (value) {
        if (value == null || !Utils.isvalidEmail(value)) {
          return ' Enter valid Email ';
        } else {
          return null;
        }
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email Adress",
        labelText: "Email",
      ),
    );
  }

  buildContactFormField() {
    return TextFormField(
      controller: ContactController,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 11) {
          return ' Enter valid Contact ';
        } else {
          return null;
        }
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Contact",
        labelText: "Contact",
      ),
    );
  }

  buildChooseGender() {
    return Row(
      children: [
        Text("Gender"),
        Expanded(
            child: RadioListTile(
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                updateGenderSelection(value.toString());
              },
              // title: Text("Male",),
            )),
        Text("male"),
        Expanded(
            child: RadioListTile(
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                updateGenderSelection(value.toString());
              },
              //  title: Text("Female"),
            )),
        Text("Female"),
        Expanded(
            child: RadioListTile(
              value: "other",
              groupValue: gender,
              onChanged: (value) {
                updateGenderSelection(value.toString());
              },
              // title: Text("other"),
            )),
        Text("other")
      ],
    );
  }

  buildSelecttype() {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select user type';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        userType = newValue.toString();
      },
      decoration:
      InputDecoration(hintText: "Select User", labelText: "Select User"),
      items: [
        DropdownMenuItem(value: "User", child: Text("User")),
        DropdownMenuItem(value: "Admin", child: Text("Admin"))
      ],
      onChanged: (value) {},
    );
  }

  buildBirthdate() {
    return TextFormField(
      controller: dobController,
      onTap: () {
        showdate(context);

        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          //DateTime pickdate=DateTime();
          dobController.text = dob;
        });
      },
      decoration: InputDecoration(
          labelText: "Select BirthDate",
          suffixIcon: Icon(Icons.calendar_month)),
    );
  }

  buildAddress() {
    return TextFormField(
      controller: AdressController,
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Address",
      ),
    );
  }

  buildPassword() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: !passwordview,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordview = !passwordview;
              });
            },
            icon: Icon(passwordview
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined)),
        labelText: "Password",
        hintText: 'Enter password',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildConfirmPassword() {
    return TextFormField(
      controller: ConfirmPasswordController,
      keyboardType: TextInputType.text,
      obscureText: !passwordview,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordview = !passwordview;
              });
            },
            icon: Icon(passwordview
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined)),
        labelText: "Confirm password",
        hintText: 'Enter password',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildSignUpButtonWidget(BuildContext context) {
    return MaterialButton(
      color: Colors.indigoAccent,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {
        String FirstName = FirstNameControllerController.text.toString().trim();
        String LastName = LastNameController.text.toString().trim();
        String Email = EmailController.text.toString().trim();
        int Contact = int.parse(ContactController.text.toString().trim());
        String Address = AdressController.text.toString().trim();
        String Dob = dobController.text.toString().trim();
        String password = passwordController.text.toString().trim();
        String ConfirmPassword =
        ConfirmPasswordController.text.toString().trim();
        String UserType = userType;
        String Gender=gender;
        // UserData.setdata(
        //     Address: Address,
        //     ConfirmPassword: ConfirmPassword,
        //     Contact: Contact,
        //     Email: Email,
        //     LastName: LastName,
        //     password: password,
        //     FirstName: FirstName);
        // Navigator.push(context, MaterialPageRoute(builder: (context) =>
        //     HomeScreen(email: Email, firstName: FirstName),));

        // if (_formkey.currentState!.validate()) {
        //
        // }
        var user = AppUser(Gender: gender,
            LastName: LastName,
            ConfirmPassword: ConfirmPassword,
            Address: Address,
            Contact: Contact,
            Dob: Dob,
            Email: Email,
            FirstName: FirstName,
            Password: password,
            UserType: UserType);
        createAccount(user, context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Future showdate(BuildContext context) async {
    {
      var dates = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2002),
          lastDate: DateTime(2025));
      if (dates != null) {
        setState(() {
          dob = '${dates.day}/${dates.month}/${dates.year}';
          dobController.text = dob;
        });
      }
    }
  }

  Future<void> createAccount(AppUser user, BuildContext context) async {
    final credential = await _service.signUp(user.Email!, user.Password!);
    if (credential is UserCredential) {
      if (credential.user != null) {
        print(
            'uid : ${credential.user!.uid}    email : ${credential.user!
                .email}');
        user.id = credential.user!.uid;
        _service.CreateUser(user).then((value) =>
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ))).catchError((error) {
          print(error);
        });
      } else if (credential is String) {
        print(credential);
      }
    }
  }
}
