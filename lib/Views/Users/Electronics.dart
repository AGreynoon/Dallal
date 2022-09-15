import 'package:dallal/Views/Users/Sections.dart';
import 'package:flutter/material.dart';

class Electronics extends StatelessWidget {
  const Electronics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyElectronics(),
    );
  }
}

class MyElectronics extends StatefulWidget {
  const MyElectronics({Key? key}) : super(key: key);

  @override
  State<MyElectronics> createState() => _MyElectronicsState();
}

class _MyElectronicsState extends State<MyElectronics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Electronics'),
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
