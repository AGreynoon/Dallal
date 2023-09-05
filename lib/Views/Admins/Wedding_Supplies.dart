import 'package:dallal/Views/Admins/Sections.dart';
import 'package:flutter/material.dart';

class Wedding_Supplies extends StatelessWidget {
  const Wedding_Supplies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home:MyWedding_Supplies() ,
    );
  }
}

class MyWedding_Supplies extends StatefulWidget {
  const MyWedding_Supplies({Key? key}) : super(key: key);

  @override
  State<MyWedding_Supplies> createState() => _MyWedding_SuppliesState();
}

class _MyWedding_SuppliesState extends State<MyWedding_Supplies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weeding Supplies'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sections()));
            },
            icon: Icon(Icons.arrow_back_outlined)),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
