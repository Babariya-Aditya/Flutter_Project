import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  late String FirstName;
  late String LastName;
  late String Email;
  late int Contact;
  late String Address;
  late String password;
  late String ConfirmPassword;
  static setdata({FirstName,LastName,
    Email,
    Contact,
    Address,
    password, ConfirmPassword}) async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString('First', FirstName);
    pref.setString('Last', LastName);
    pref.setString('Email', Email);
    pref.setInt('Contact', Contact);
    pref.setString('Addess', Address);
    pref.setString('password', password);
    pref.setString('ConfirmPassword', ConfirmPassword);
  }



}