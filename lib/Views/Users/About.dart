import 'package:dallal/Views/Users/Settings.dart';
import 'package:flutter/material.dart';


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('About The App'),
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
          body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/Dallal_with_background.jpg'),
                        radius: 80.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Dallal",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                      Text("An Application for \nLeasing or Renting Advertisements",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text("It's designed for helping the tenant to search for the products to rent and the lessor to offer products for rent in an easy and simple way.",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 150),
                    Text("Version: 1.0 (beta)",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
    );
  }
}
