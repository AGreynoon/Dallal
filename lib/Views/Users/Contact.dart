import 'package:dallal/Views/Users/Settings.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Contact Us'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
              icon: Icon(Icons.arrow_back_outlined)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Icon(
                Icons.phone,
                size: 30,
                color: Color.fromRGBO(90, 70, 178, 1),
              ),
              title: Text(
                "   +967 771835268",
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));*/
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Icon(
                Icons.email,
                size: 30,
                color: Color.fromRGBO(90, 70, 178, 1),
              ),
              title: Text(
                "   Dallal@support.com",
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Contact()));*/
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Icon(
                Icons.web,
                size: 30,
                color: Color.fromRGBO(90, 70, 178, 1),
              ),
              title: Text(
                "   www.Dallal.com",
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Contact()));*/
              },
            ),
          ],
        ),
        ),
      );
  }
}
