class User {
 late int userID;
  late bool isAdmin;
  late bool isActive;
 late String fname;
 late String lname;
 late String email;
 late String userPassword;
 late String phoneNumber;
 late String whatsApp;
 late int addressId;


  User(
      {required this.userID,
        required this.isAdmin,
        required this.isActive,
        required this.fname,
        required this.lname,
        required this.email,
        required this.userPassword,
        required this.phoneNumber,
        required this.whatsApp,
        required this.addressId});

  User.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    isAdmin = json['isAdmin'];
    isActive = json['isActive'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    userPassword = json['userPassword'];
    phoneNumber = json['phoneNumber'];
    whatsApp = json['whatsApp'];
    addressId = json['addressId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['isAdmin'] = this.isAdmin;
    data['isActive'] = this.isActive;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['userPassword'] = this.userPassword;
    data['phoneNumber'] = this.phoneNumber;
    data['whatsApp'] = this.whatsApp;
    data['addressId'] = this.addressId;
    return data;
  }
}
