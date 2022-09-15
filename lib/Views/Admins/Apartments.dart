import 'package:dallal/Views/Admins/Sections.dart';
import 'package:flutter/material.dart';

class Apartments extends StatelessWidget {
  const Apartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApartments(),
    );
  }
}

class MyApartments extends StatefulWidget {
  const MyApartments({Key? key}) : super(key: key);

  @override
  State<MyApartments> createState() => _MyApartmentsState();
}

class _MyApartmentsState extends State<MyApartments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Apartments'),
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
