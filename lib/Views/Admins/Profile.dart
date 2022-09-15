import 'package:dallal/Views/Admins/Home.dart';
import 'package:dallal/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          OutlinedButton(
            onPressed: ()async{
              var prefs = await SharedPreferences.getInstance();
              prefs.remove("userid");
              prefs.remove('isadmin');
              prefs.remove('isactive');
              prefs.remove('fname');
              prefs.remove('lname');
              prefs.remove('email');
              prefs.remove('phone');
              prefs.remove('whats');
              prefs.remove('addressid');
              setState(() {

              });

              Get.offAll(Root());

            },
            child: Text("Log-out",
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white)),
            style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromRGBO(90, 70, 178, 1),
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15))),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeForAdmin()));
            },
            icon: Icon(Icons.arrow_back_outlined)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/avatar.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _inputField(context),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: /*Theme.of(context).primaryColor.withOpacity(0.1),*/
              Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'UserName: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'First Name: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Last Name: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Password: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Email: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Phone Number: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'WhatsApp: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Governorate: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: Color.fromRGBO(63, 63, 156, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(63, 63, 156, 1),
            ),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'District: ',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

