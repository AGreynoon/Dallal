import 'package:dallal/Models/Users.dart';
import 'package:dallal/Views/Users/Edit_Profile.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:dallal/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

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
  var myMenuItems = <String>[
    'Edit Profile',
    // 'Delete Account',
    'Log-out',
  ];
User? userLogedIn;
  void onSelect(item) {
    switch (item) {
      case 'Edit Profile':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditProfile(userLogedIn: userLogedIn!,)));
        break;
      case 'Delete Account':
        print('Delete Account clicked');
        break;
      case 'Log-out':
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text('Logging out'),
          content: Text('Do you want to log out?'),
          actions: [
            OutlinedButton(onPressed: ()async{
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

              Get.to(Root());

            }, child: Text('Yes')),
            OutlinedButton(onPressed: (){Get.back();}, child: Text('Cancel')),
          ],
        ));

        break;
    }
  }
  @override
  getdata()async{
    var prefs=await SharedPreferences.getInstance();

    userLogedIn=User(
        userID: prefs.getInt('userid') ?? 0,
        isAdmin: prefs.getBool('isadmin') ?? false,
        isActive: prefs.getBool('isactive') ?? false,
        fname: prefs.getString('fname') ?? '',
        lname: prefs.getString('lname') ?? '',
        email: prefs.getString('email') ?? '',
        userPassword: '',
        phoneNumber: prefs.getString('phone') ?? '',
        whatsApp: prefs.getString('whats') ?? '',
        addressId: prefs.getInt('addressid') ?? 0);
    setState(() {

    });
  }
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: onSelect,
              itemBuilder: (BuildContext context) {
                return myMenuItems.map((String choice) {
                  return PopupMenuItem<String>(
                    child: Text(choice),
                    value: choice,
                  );
                }).toList();
              }),
        ],
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
        // Card(
        //   color: Color.fromRGBO(63, 63, 156, 1),
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //       color: /*Theme.of(context).primaryColor.withOpacity(0.1),*/
        //       Color.fromRGBO(63, 63, 156, 1),
        //     ),
        //     borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        //   ),
        //   child: Container(
        //     padding: EdgeInsets.all(20.0),
        //     child: Text(
        //       'UserName: ',style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 10),
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
              'First Name: ${userLogedIn!.fname}',style: TextStyle(color: Colors.white),
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
              'Last Name: ${userLogedIn!.lname}',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // const SizedBox(height: 10),
        // Card(
        //   color: Color.fromRGBO(63, 63, 156, 1),
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //       color: Color.fromRGBO(63, 63, 156, 1),
        //     ),
        //     borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        //   ),
        //   child: Container(
        //     padding: EdgeInsets.all(20.0),
        //     child: Text(
        //       'Password: ',style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
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
              'Email: ${userLogedIn!.email}',style: TextStyle(color: Colors.white),
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
              'Phone Number: ${userLogedIn!.phoneNumber}',style: TextStyle(color: Colors.white),
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
              'WhatsApp: ${userLogedIn!.whatsApp}',style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // const SizedBox(height: 10),
        // Card(
        //   color: Color.fromRGBO(63, 63, 156, 1),
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //       color: Color.fromRGBO(63, 63, 156, 1),
        //     ),
        //     borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        //   ),
        //   child: Container(
        //     padding: EdgeInsets.all(20.0),
        //     child: Text(
        //       'Governorate: ',style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 10),
        // Card(
        //   color: Color.fromRGBO(63, 63, 156, 1),
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //       color: Color.fromRGBO(63, 63, 156, 1),
        //     ),
        //     borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        //   ),
        //   child: Container(
        //     padding: EdgeInsets.all(20.0),
        //     child: Text(
        //       'District: ',style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

