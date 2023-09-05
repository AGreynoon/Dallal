import 'package:dallal/Userpref.dart';
import 'package:dallal/Views/Users/Sections.dart';
import 'package:dallal/constrant.dart';
import 'package:flutter/material.dart';
import 'package:dallal/Views/Log-in.dart';
import 'package:dallal/Views/Users/Sign-up.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/Users.dart';
import 'Views/Admins/Home.dart';
import 'Views/Admins/Reports.dart';
import 'Views/Users/Add_Post.dart';
//import 'package:dallal/Views/Admins/Home.dart';



void main()async {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // '/':(context) => Login(),
          '/Signup':(context) => Signup(),
          '/Home':(context) => Home(),
          // '/':(context) => Home(),
        },
        home:Root(),
      )
  );
}
class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  String fname='';
  bool isAdmin=false;
  getdata()async{
    var prefs=await SharedPreferences.getInstance();
    fname=prefs.getString('fname')??'';
    isAdmin=prefs.getBool('isadmin')??false;
    setState(() {

    });
  }
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return fname==''?Login():isAdmin?HomeForAdmin():Home();
  }
}




