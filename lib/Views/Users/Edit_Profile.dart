import 'package:dallal/Controllers/AddressesController.dart';
import 'package:dallal/Controllers/UsersController.dart';
import 'package:dallal/Models/Addresses.dart';
import 'package:dallal/Models/Users.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:dallal/Views/Users/Profile.dart';
import 'package:dallal/constrant.dart';
import 'package:dallal/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  final User userLogedIn;
  EditProfile({required this.userLogedIn});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool visible_password = true;
  TextEditingController fnController = TextEditingController();
  TextEditingController lnController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController whatsController = TextEditingController();
  bool firstLoad = true;

  var myMenuItems = <String>[
    // 'Edit Profile',
    'Delete Account',
    'Log-out',
  ];
  String dropdownvalue1 = 'Governorate';
  String dropdownvalue2 = 'District';
  int addressId = 0;

  var governorates = [
    'Governorate',
    'Hadhramout',
    'Aden',
    'Al Maharah',
    'Shabwah',
  ];

  var districts = [
    'Al Mukalla',
    'Ash Shihr',
    'Seiyun',
    'Crater',
    'Al-Maala',
    'Shaykh Uthman',
    'Al Ghaydah',
    'Sayhut',
    'Qishn',
    'Ataq',
    'Bayhan',
    'Habban',
    'At Talh',
    'District',
  ];
  void onSelect(item) {
    switch (item) {
      // case 'Edit Profile':
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => EditProfile()));
      //   break;
      case 'Delete Account':
        print('Delete Account clicked');
        break;
      case 'Log-out':
        AlertDialog(
          title: Text('Logging out'),
          content: Text('Do you want to log out?'),
          actions: [
            OutlinedButton(onPressed: () {}, child: Text('Yes')),
            OutlinedButton(onPressed: () {}, child: Text('Cancel')),
          ],
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      firstLoad=false;
      fnController.text = widget.userLogedIn.fname;
      lnController.text = widget.userLogedIn.lname;

      passwordController.text = widget.userLogedIn.userPassword;

      emailController.text = widget.userLogedIn.email;

      phoneController.text = widget.userLogedIn.phoneNumber;

      whatsController.text = widget.userLogedIn.whatsApp;
      addressId = widget.userLogedIn.addressId;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
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
                  context, MaterialPageRoute(builder: (context) => Profile()));
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
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Color.fromRGBO(90, 70, 178, 1),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _inputField(context),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(90, 70, 178, 1),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => Container(
                                width: 100,
                                height: 100,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ));
                      String result = await UserController.editUser(widget.userLogedIn.userID,User(
                          userID: widget.userLogedIn.userID,
                          isAdmin: false,
                          isActive: true,
                          fname: fnController.text,
                          lname: lnController.text,
                          email: emailController.text,
                          userPassword: 'a',
                          phoneNumber: phoneController.text,
                          whatsApp: whatsController.text,
                          addressId: addressId));
                      if(result=='ok'){
                        niceDialog(context, true);
                        Get.offAll(Root());
                      }else
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(result),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                    },
                                    child: Text('OK'))
                              ],
                            ));
                    },
                    child: Text("SAVE",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(90, 70, 178, 1),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              )
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
        TextField(
          controller: fnController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "First name",
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Color.fromRGBO(63, 63, 156, 1),
            filled: true,
            prefixIcon: const Icon(Icons.person, color: Colors.white),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: lnController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Last name",
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Color.fromRGBO(63, 63, 156, 1),
            filled: true,
            prefixIcon: const Icon(Icons.person, color: Colors.white),
          ),
          keyboardType: TextInputType.text,
        ),
        // const SizedBox(height: 10),
        // TextField(
        //   controller: passwordController,
        //   style: TextStyle(color: Colors.white),
        //   decoration: InputDecoration(
        //     hintText: "Password",
        //     hintStyle: TextStyle(color: Colors.white),
        //     border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(18),
        //         borderSide: BorderSide.none),
        //     fillColor: Color.fromRGBO(63, 63, 156, 1),
        //     filled: true,
        //     prefixIcon: const Icon(Icons.lock, color: Colors.white),
        //     suffixIcon: IconButton(
        //       icon: visible_password ? Icon(Icons.visibility, color: Colors.white) : Icon(
        //           Icons.visibility_off, color: Colors.white),
        //       onPressed: () {
        //         setState(() {
        //           visible_password = !visible_password;
        //         });
        //       },
        //     ),
        //   ),
        //   keyboardType: TextInputType.visiblePassword,
        //   obscureText: visible_password,
        // ),
        const SizedBox(height: 10),
        TextField(
          controller: emailController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Color.fromRGBO(63, 63, 156, 1),
            filled: true,
            prefixIcon: const Icon(Icons.email, color: Colors.white),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: phoneController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Phone number",
            hintStyle: TextStyle(color: Colors.white),
            prefixText: "+967",
            prefixStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Color.fromRGBO(63, 63, 156, 1),
            filled: true,
            prefixIcon: const Icon(Icons.phone, color: Colors.white),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: whatsController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Whatsapp",
            hintStyle: TextStyle(color: Colors.white),
            prefixText: "http://wa.me/",
            prefixStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Color.fromRGBO(63, 63, 156, 1),
            filled: true,
            prefixIcon: const Icon(Icons.whatsapp, color: Colors.white),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 240,
          child: FutureBuilder<List<Address>>(
            future: AddressesController.fetchAllAddresses(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Address>> snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  width: 240,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color.fromRGBO(63, 63, 156, 1),
                          )),
                    ),
                    value: addressId,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: [
                      for (var i in snapshot.data!)
                        DropdownMenuItem(
                          value: i.addressID,
                          child: Text(i.governorate),
                        ),
                    ],
                    onChanged: (v) {
                      print(v);
                      addressId = v as int;
                    },
                  ),
                );
              } else
                return CircularProgressIndicator();
            },
          ),
        ),
        SizedBox(height: 5.0),
        SizedBox(
          width: 240,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 3,
                    color: Color.fromRGBO(63, 63, 156, 1),
                  )),
            ),
            value: dropdownvalue2,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: districts.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue2 = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }
}
