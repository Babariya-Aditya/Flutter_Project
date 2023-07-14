import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils{
  static String bool_Login="islogin";
  static String bool_Onboarding="isBoarded";

  static late SharedPreferences _instance;
  static Future<SharedPreferences>init() async {
    _instance=await SharedPreferences.getInstance();
    return _instance;
  }
  static Future<bool>UpdateLoginStatus(bool status) async {
    return await _instance.setBool(bool_Login, status);
  }
  static bool getLoginStatus(){
    return _instance.getBool(bool_Login)?? false;
  }
  static Future<bool>OnBoardingStatus(bool status) async {
    return await _instance.setBool(bool_Onboarding, status);
  }
  static bool getOnboardingstatus(){
    return _instance.getBool(bool_Onboarding)?? false;
  }
  static Future<bool> logout() async {
    return await _instance.remove(bool_Login);
  }






}