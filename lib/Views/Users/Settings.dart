import 'package:dallal/Views/Users/About.dart';
import 'package:dallal/Views/Users/Contact.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(63, 63, 156, 1),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.arrow_back_outlined)),
        ),
        backgroundColor: Colors.white,
        body: ListView(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(
                  Icons.info,
                  size: 30,
                  color: Color.fromRGBO(63, 63, 156, 1),
                ),
                title: Text(
                  "   About The App",
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => About()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(
                  Icons.email,
                  size: 30,
                  color: Color.fromRGBO(63, 63, 156, 1),
                ),
                title: Text(
                  "   Contact Us",
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Contact()));
                },
              ),
            ],
          ),
        ),
    );
  }
}
