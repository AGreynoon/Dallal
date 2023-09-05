import 'package:dallal/Views/Users/Apartments.dart';
import 'package:dallal/Views/Users/Electronics.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:dallal/Views/Users/Swimming_Pools.dart';
import 'package:dallal/Views/Users/Tools.dart';
import 'package:dallal/Views/Users/DisplayProducts.dart';
import 'package:dallal/Views/Users/Wedding_Supplies.dart';
import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: MySections(),
    );
  }
}

class MySections extends StatefulWidget {
  const MySections({Key? key}) : super(key: key);

  @override
  State<MySections> createState() => _MySectionsState();
}

class _MySectionsState extends State<MySections> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sections'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => DisplayProducts(section: 'vehicles',)));
                      });
                    },
                    icon: Image.asset("assets/Sections/vehicles.png"),
                    iconSize: 90,
                  ),
                  Text(
                      "Vehicles", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => DisplayProducts(section: 'apartments',)));
                      });
                    },
                    icon: Image.asset("assets/Sections/apartments.png"),
                    iconSize: 90,
                  ),
                  Text(
                      "Apartments", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => DisplayProducts(section: 'electronics',)));
                      });
                    },
                    icon: Image.asset("assets/Sections/electronics.png"),
                    iconSize: 90,
                  ),
                  Text(
                      "Electronics", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => DisplayProducts(section: 'tools',)));
                      });
                    },
                    icon: Image.asset("assets/Sections/tools.png"),
                    iconSize: 90,
                  ),
                  Text(
                      "Tools", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => DisplayProducts(section: 'wedding',)));
                      });
                    },
                    icon: Image.asset("assets/Sections/wedding_supplies.png"),
                    iconSize: 90,
                  ),
                  Text(
                      "Wedding \nSupplies",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => DisplayProducts(section: 'pools',)));
                      });
                    },
                    icon: Image.asset("assets/Sections/swimming_pools.png"),
                    iconSize: 90,
                  ),
                  Text(
                    "Swimming \nPools",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

