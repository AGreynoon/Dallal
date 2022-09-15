import 'package:cached_network_image/cached_network_image.dart';
import 'package:dallal/Controllers/ReportsController.dart';
import 'package:dallal/Models/Products.dart';
import 'package:dallal/Models/Reports.dart';
import 'package:dallal/Userpref.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:dallal/constrant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// class Post extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //debugShowCheckedModeBanner: false,
//       home: MyPost(),
//     );
//   }
// }

class MyPost extends StatefulWidget {
  const MyPost({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  double value = 3.5;
  int userID=0;
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  @override
  void getDate()async{
    var prefs=await SharedPreferences.getInstance();
    userID=prefs.getInt('userid')??0;
    setState(() {

    });
    print(userID);
  }
  void initState() {
    getDate();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var userLogedInId=UserPreferences().getUser().userID;
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
                  context, MaterialPageRoute(builder: (context) => Home()));
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
                              child: CachedNetworkImage(imageUrl: server.serverUrl.replaceFirst('/api/', '')+ widget.product.picsPath,
                                useOldImageOnUrlChange: true,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          widget.product.user.fname+" "+widget.product.user.lname,
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
              Text(
                "Rate: ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                color: Color.fromRGBO(63, 63, 156, 1),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: RatingStars(
                  value: value,
                  onValueChanged: (v) {
                    //
                    setState(() {
                      value = v;
                    });
                  },
                  starBuilder: (index, color) => Icon(
                    Icons.star_border_outlined,
                    color: color,
                  ),
                  starCount: 5,
                  starSize: 30,
                  valueLabelColor: const Color(0xff9b9b9b),
                  valueLabelTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                  valueLabelRadius: 15,
                  maxValue: 5,
                  starSpacing: 2,
                  maxValueVisibility: true,
                  valueLabelVisibility: true,
                  animationDuration: Duration(milliseconds: 1000),
                  valueLabelPadding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                  valueLabelMargin: const EdgeInsets.only(right: 8),
                  starOffColor: const Color(0xffe7e8ea),
                  starColor: Colors.yellow,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.call),
                    label: Text("Call"),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(90, 70, 178, 1),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.whatsapp),
                    label: Text("WhatsApp"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(90, 70, 178, 1),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: ()async {
                  showDialog(context: context, builder: (context)=> Container(
                    width: 100,
                    height: 100,
                    child: Center(child: CircularProgressIndicator(),),));
                 bool result=await ReportController.post(Report(reportID: 0, userId: userID, productId: widget.product.productId,));
                  if(result)
                    Get.back();
                  niceDialog(context, result);
                },
                icon: Icon(Icons.report_problem_outlined),
                label: Text("Report"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(90, 70, 178, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
