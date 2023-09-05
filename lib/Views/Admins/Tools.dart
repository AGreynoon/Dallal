import 'package:dallal/Views/Admins/Sections.dart';
import 'package:flutter/material.dart';

class Tools extends StatelessWidget {
  const Tools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: MyTools(),
    );
  }
}

class MyTools extends StatefulWidget {
  const MyTools({Key? key}) : super(key: key);

  @override
  State<MyTools> createState() => _MyToolsState();
}

class _MyToolsState extends State<MyTools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tools'),
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
