import 'Models/Users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._const();
  factory UserPreferences() {
    return _instance;
  }
  UserPreferences._const();

  SharedPreferences? prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

User getUser() {

    return User(
        userID: prefs?.getInt('userid') ?? 0,
        isAdmin: prefs?.getBool('isadmin') ?? false,
        isActive: prefs?.getBool('isactive') ?? false,
        fname: prefs?.getString('fname') ?? '',
        lname: prefs?.getString('lname') ?? '',
        email: prefs?.getString('email') ?? '',
        userPassword: '',
        phoneNumber: prefs?.getString('phone') ?? '',
        whatsApp: prefs?.getString('whats') ?? '',
        addressId: prefs?.getInt('addressid') ?? 0);
  }
  setUser(User user){
     prefs?.setInt('userid',user.userID);
     prefs?.setBool('isadmin',user.isAdmin) ;
     prefs?.setBool('isactive',user.isActive);
     prefs?.setString('fname',user.fname) ;
     prefs?.setString('lname',user.lname) ;
     prefs?.setString('email',user.email) ;
     prefs?.setString('phone',user.phoneNumber) ;
     prefs?.setString('whats',user.whatsApp) ;
     prefs?.setInt('addressid',user.addressId) ;
  }

  deleteUser() {
    prefs?.remove("userid");
    prefs?.remove('isadmin');
    prefs?.remove('isactive');
    prefs?.remove('fname');
    prefs?.remove('lname');
    prefs?.remove('email');
    prefs?.remove('phone');
    prefs?.remove('whats');
    prefs?.remove('addressid');
  }
}
