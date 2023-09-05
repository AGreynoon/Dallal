import 'package:dallal/Controllers/UsersController.dart';
import 'package:dallal/Models/Users.dart';
import 'package:dallal/Views/Users/Sign-up.dart';
import 'package:dallal/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible_password = true;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordlController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child:
          Stack(children: [_header(size), _PersonIcon(), _Input_Form(context)]),
    ));
  }

  SingleChildScrollView _Input_Form(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: (Offset(0, 5)))
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Text(
                    "Log in",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: Form(
                      key: _formkey,
                        child: Column(
                      children: [
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
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: passwordlController,
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
                          validator: MinLengthValidator(9, errorText: "should be at least 9 characters"),
                        ),
                        const SizedBox(height: 30),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          color: Colors.deepPurple,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            child: const Text(
                              'Log in',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            if(_formkey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      Container(
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ));
                              String result = await UserController.Login(User(
                                  userID: 0,
                                  isAdmin: false,
                                  isActive: false,
                                  fname: 'a',
                                  lname: 'a',
                                  email: emailController.text,
                                  userPassword: passwordlController.text,
                                  phoneNumber: '1',
                                  whatsApp: 'a',
                                  addressId: 0));
                              Get.back();
                              if (result == 'ok') {
                                Get.offAll(Root());
                                setState(() {

                                });
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
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Color.fromRGBO(90, 70, 178, 1)),
                  )),
            ],
          )
        ],
      ),
    );
  }

  SafeArea _PersonIcon() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Container _header(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(child: boolHeader(), top: 90, left: 30),
          Positioned(child: boolHeader(), top: -40, left: -30),
          Positioned(child: boolHeader(), top: -50, right: -20),
          Positioned(child: boolHeader(), bottom: -50, left: 10),
          Positioned(child: boolHeader(), bottom: 120, right: 20),
          const Positioned(
              child: Text("Welcome Back",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              bottom: 80,
              right: 70),
        ],
      ),
    );
  }

  Container boolHeader() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
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
