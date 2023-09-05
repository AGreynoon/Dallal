import 'package:cached_network_image/cached_network_image.dart';
import 'package:dallal/Controllers/ProductsController.dart';
import 'package:dallal/Models/Products.dart';
import 'package:dallal/Views/Admins/Home.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dallal/constrant.dart';

class Post extends StatefulWidget {
  const Post({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  double value = 3.5;
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeForAdmin()));
            },
            icon: Icon(Icons.arrow_back_outlined)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Description:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                color: Color.fromRGBO(63, 63, 156, 1),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      widget.product.description,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    // Text(
                    //   "مواصفات الجهاز:",
                    //   style: TextStyle(fontSize: 20, color: Colors.white),
                    // ),
                    // Text(
                    //   '''processor: Core I7 8th generation \nDriver: 1TB HDD, 250 GB SSD\n Ram: 12 GB DDR3 \nGraphic: AMD Radion R8 4 GB \nScreen: 15.6 inch FHD''',
                    //   style: TextStyle(fontSize: 20, color: Colors.white),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Images: ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                color: Color.fromRGBO(63, 63, 156, 1),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      child: Card(
                        child: Container(
                            height: 100,
                            width: 100,
                            child: CachedNetworkImage(
                              imageUrl:
                                  server.serverUrl.replaceFirst('/api/', '') +
                                      widget.product.picsPath,
                              useOldImageOnUrlChange: true,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Details: ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                color: Color.fromRGBO(63, 63, 156, 1),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Price: ${widget.product.price}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Currency: ${widget.product.currency}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Period of time: ${widget.product.periodOfTime}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Governorate: ${widget.product.address.governorate}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "District: Al Mukalla",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          widget.product.user.fname +
                              " " +
                              widget.product.user.lname,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        //Text("Owner: "),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => Container(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ));
                      bool result=await ProductController.blockOrUnBlockProduct(widget.product.productId);
                      niceDialog(context, result);
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.block),
                    label: Text(widget.product.isBlocked?"UnBlock":"Block"),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(90, 70, 178, 1),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton.icon(
                    onPressed: ()async {
                      showDialog(
                          context: context,
                          builder: (context) => Container(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ));
                      bool result=await ProductController.deleteProduct(widget.product.productId);
                      niceDialog(context, result);
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.delete),
                    label: Text("Delete"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
