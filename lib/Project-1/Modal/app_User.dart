class AppUser{
  String? id;
  String? FirstName;
  String? LastName;
  String? Email;
  int? Contact;
  String? UserType;
  String? Dob;
  String? Gender;
  String? Address;
  String? ConfirmPassword;
  String? Password;

  AppUser(
      {this.id,
      this.FirstName,
      this.LastName,
      this.Email,
      this.Contact,
      this.UserType, this.Gender,
      this.Dob,
      this.Address,
      this.ConfirmPassword,
      this.Password});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'FirstName': this.FirstName,
      'LastName': this.LastName,
      'Email': this.Email,
      'Contact': this.Contact,
      'UserType': this.UserType,
      'Dob': this.Dob,
      'Gender': this.Gender,
      'Address': this.Address,
      'ConfirmPassword': this.ConfirmPassword,
      'Password': this.Password,
    };
  }


  }




