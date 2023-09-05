import 'package:cached_network_image/cached_network_image.dart';
import 'package:dallal/Controllers/ProductsController.dart';
import 'package:dallal/Models/Products.dart';
import 'package:dallal/Views/Users/EditPost.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:dallal/Views/Users/Post_Details.dart';
import 'package:dallal/constrant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Management extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: MyManagement(),
    );
  }
}
class MyManagement extends StatefulWidget {
  const MyManagement({Key? key}) : super(key: key);

  @override
  State<MyManagement> createState() => _MyManagementState();
}

class _MyManagementState extends State<MyManagement> {
  int userID=0;
  List<Postelement> postslist = [
    Postelement(
        titlepost: 'hp لابتوب للايجار',
        price: '10000',
        imageUrl: 'assets/Products/hplaptop.jpg',
        period: 'Month',
        date: 'Today',
        currency: 'Yemeni Rial'),
    Postelement(
      titlepost: 'مطلوب شقه للايجار',
      price: '150000',
      imageUrl: 'assets/Products/Noimage.jpg',
      period: 'year',
      date: 'Yesterday',
      currency: 'Yemeni Rial',),
    Postelement(
      titlepost: 'كاميرا كانون نظيفه للايجار',
      price: '500',
      imageUrl: 'assets/Products/CameraCanon.jpg',
      period: 'day',
      date: '1/1/2020',
      currency: 'Yemeni Rial',)
  ];
  @override
  void getDate()async{
    var prefs=await SharedPreferences.getInstance();
    userID=prefs.getInt('userid')??0;
    setState(() {

    });
  }
  void initState() {
    getDate();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Management'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.arrow_back_outlined)),
      ),
      body:  FutureBuilder<List<Product>>(
        future: ProductController.fetchAllProductsByUserId(userID),
        builder: (BuildContext context,
            AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => MyPost(product: snapshot.data![index],)));
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(children: [
                        Container(
                            margin: EdgeInsets.only(left: 8.0),
                            width: 100,
                            height: 100,
                            child: CachedNetworkImage(
                              imageUrl:
                              server.serverUrl.replaceFirst('/api/', '') +
                                  snapshot.data![index].picsPath,
                              useOldImageOnUrlChange: true,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].title,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(snapshot.data![index].dateTime.split('.')[0],
                                  style: TextStyle(fontSize: 15)),
                              SizedBox(height: 10),
                              Container(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data![index].price.toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      snapshot.data![index].currency,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(snapshot.data![index].periodOfTime,
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              Container(
                                width: 270,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedButton(
                                      onPressed: ()  {
                                        Get.to(EditPost(product: snapshot.data![index]));

                                      },
                                      child: Text("Edit",
                                          style: TextStyle(
                                              fontSize: 15,
                                              letterSpacing: 2,
                                              color: Colors.white)),
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor:
                                          Color.fromRGBO(90, 70, 178, 1),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20))),
                                    ),
                                    OutlinedButton(
                                      onPressed: ()async {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Container(
                                              width: 100,
                                              height: 100,
                                              child: Center(
                                                child:
                                                CircularProgressIndicator(),
                                              ),
                                            ));
                                        setState(() {

                                        });
                                        bool result=await ProductController.deleteProduct(snapshot.data![index].productId);
                                        niceDialog(context, result);
                                        setState(() {

                                        });
                                      },
                                      child: Text("Delete",
                                          style: TextStyle(
                                              fontSize: 15,
                                              letterSpacing: 2,
                                              color: Colors.white)),
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                });
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
class Postelement {
  late String titlepost;
  late String price;
  late String imageUrl;
  late String period;
  late String date;
  late String currency;
  Postelement(
      {required this.titlepost,
        required this.price,
        required this.imageUrl,
        required this.period,
        required this.date,
        required this.currency,});
}
