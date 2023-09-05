import 'package:dallal/Controllers/AddressesController.dart';
import 'package:dallal/Controllers/UsersController.dart';
import 'package:dallal/Models/Addresses.dart';
import 'package:dallal/Models/Users.dart';
import 'package:dallal/Views/Log-in.dart';
import 'package:dallal/constrant.dart';
import 'package:dallal/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool visible_password = true;
  late int dropdownvalue1 = 0;
  String dropdownvalue2 = 'District';
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child:
            Column(children: [_header(size), _Input_Form(context), footer()]),
          ),
        ));
  }

  Container _Input_Form(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, blurRadius: 15, offset: (Offset(0, 5)))
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            "Sign up",
            style: Theme
                .of(context)
                .textTheme
                .headline5,
          ),
          const SizedBox(height: 10),
          Container(
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: fNameController,
                      autocorrect: false,
                      decoration: InputDecorations.inputDecoration(
                        hinttext: "First name",
                        labeltext: "First name",
                        icono: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.text,
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                    TextFormField(
                      controller: lNameController,
                      autocorrect: false,
                      decoration: InputDecorations.inputDecoration(
                        hinttext: "Last name",
                        labeltext: "Last name",
                        icono: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.text,
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                    TextFormField(
                      controller: emailController,
                      autocorrect: false,
                      decoration: InputDecorations.inputDecoration(
                        hinttext: 'user@gmail.com',
                        labeltext: 'Email',
                        icono: Icon(Icons.alternate_email_rounded),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator([
                        EmailValidator(errorText: "please enter valid email"),
                        RequiredValidator(errorText: "Required")
                      ]),
                    ),
                    TextFormField(
                      controller: phoneController,
                      autocorrect: false,
                      decoration: InputDecorations.inputDecoration(
                          hinttext: "Phone number",
                          labeltext: "Phone number",
                          icono: Icon(Icons.phone),
                          prefixtext: "+967"),
                      keyboardType: TextInputType.phone,
                      validator: MinLengthValidator(
                          9, errorText: "should be at least 9 characters"),
                    ),
                    TextFormField(
                      controller: whatsController,
                      autocorrect: false,
                      decoration: InputDecorations.inputDecoration(
                          hinttext: "Whatsapp",
                          labeltext: "Whatsapp",
                          icono: Icon(Icons.whatsapp),
                          prefixtext: "http://wa.me/"),
                      keyboardType: TextInputType.phone,
                      validator: MinLengthValidator(
                          9, errorText: "should be at least 9 characters"),
                    ),
                    TextFormField(
                      controller: passwordController,
                      autocorrect: false,
                      decoration: InputDecorations.inputDecoration(
                        hinttext: 'Password',
                        labeltext: 'Password',
                        icono: Icon(Icons.lock_outline),
                        suffixicon: IconButton(
                          icon: visible_password
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              visible_password = !visible_password;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visible_password,
                      validator: MinLengthValidator(
                          9, errorText: "should be at least 9 characters"),
                    ),
                    SizedBox(height: 10.0),
                    FutureBuilder<List<Address>>(
                      future: AddressesController.fetchAllAddresses(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Address>> snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            width: 240,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.deepPurple)),
                              ),
                              value: dropdownvalue1,
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
                                dropdownvalue1 = v as int;
                              },
                            ),
                          );
                        } else
                          return CircularProgressIndicator();
                      },
                    ),
                    // SizedBox(
                    //   width: 240,
                    //   child: DropdownButtonFormField(
                    //     decoration: InputDecoration(
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(12),
                    //           borderSide: BorderSide(width: 3, color: Colors.deepPurple)
                    //       ),
                    //     ),
                    //     value: dropdownvalue1,
                    //     icon: const Icon(Icons.keyboard_arrow_down),
                    //     items: governorates.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropdownvalue1 = newValue!;
                    //       });
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: 240,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(width: 3, color: Colors.deepPurple)),
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
                    SizedBox(height: 30),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      color: Colors.deepPurple,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  Dialog(
                                    child: Container(
                                        height: 100, width: 100,
                                        child: Center(
                                            child: CircularProgressIndicator())),
                                  ));
                          String result = await UserController.Register(User(
                              userID: 0,
                              isAdmin: false,
                              isActive: true,
                              fname: fNameController.text,
                              lname: lNameController.text,
                              email: emailController.text,
                              userPassword: passwordController.text,
                              phoneNumber: phoneController.text,
                              whatsApp: whatsController.text,
                              addressId: dropdownvalue1));
                          if (result == 'ok') {
                            Get.off(Root());
                            setState(() {});
                          }
                          else
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
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
                        }
                      },
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Row footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text(
              "Log in",
              style: TextStyle(color: Color.fromRGBO(90, 70, 178, 1)),
            )),
      ],
    );
  }
}

Container _header(Size size) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1)
        ])),
    width: double.infinity,
    height: size.height * 0.4,
    child: Stack(
      children: [
        Positioned(child: circlesHeader(), top: 90, left: 30),
        Positioned(child: circlesHeader(), top: -40, left: -30),
        Positioned(child: circlesHeader(), top: -50, right: -20),
        Positioned(child: circlesHeader(), bottom: -50, left: 10),
        Positioned(child: circlesHeader(), bottom: 120, right: 20),
        Center(
            child: Text(
              "Welcome To Dallal",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ],
    ),
  );
}

Container circlesHeader() {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)),
  );
}

//class to define the attribute we needs just one time
class InputDecorations {
  static InputDecoration inputDecoration({
    required String hinttext,
    required String labeltext,
    required Icon icono,
    String? prefixtext,
    IconButton? suffixicon,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          )),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
      hintText: hinttext,
      hintStyle: TextStyle(color: Colors.deepPurple),
      labelText: labeltext,
      labelStyle: TextStyle(color: Colors.deepPurple),
      prefixIcon: icono,
      prefixIconColor: Colors.deepPurple,
      prefixText: prefixtext,
      suffixStyle: TextStyle(color: Colors.deepPurple),
      suffixIcon: suffixicon,
      suffixIconColor: Colors.deepPurple,
    );
  }
}
