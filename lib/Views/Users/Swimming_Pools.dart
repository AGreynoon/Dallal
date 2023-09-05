import 'package:dallal/Views/Users/Sections.dart';
import 'package:flutter/material.dart';

class Swimming_Pools extends StatelessWidget {
  const Swimming_Pools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: MySwimming_Pools(),
    );
  }
}

class MySwimming_Pools extends StatefulWidget {
  const MySwimming_Pools({Key? key}) : super(key: key);

  @override
  State<MySwimming_Pools> createState() => _MySwimming_PoolsState();
}

class _MySwimming_PoolsState extends State<MySwimming_Pools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Swimming Pools'),
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
