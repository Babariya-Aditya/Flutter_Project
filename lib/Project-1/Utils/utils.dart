class Utils{
  static final  _emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final _passwordRegex =  RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
 static bool isvalidEmail(String email){
   return _emailRegex.hasMatch(email);
 }
  static bool isvalidPassword(String password){
    return _passwordRegex.hasMatch(password);
  }
}