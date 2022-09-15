import 'package:dallal/Controllers/AddressesController.dart';
import 'package:dallal/Controllers/CategoriesController.dart';
import 'package:dallal/Controllers/ProductsController.dart';
import 'package:dallal/Models/Addresses.dart';
import 'package:dallal/Models/Categories.dart';
import 'package:dallal/Models/Products.dart';
import 'package:dallal/Userpref.dart';
import 'package:dallal/Views/Users/Home.dart';
import 'package:dallal/constrant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dallal/Views/Users/Add_Post.dart';
import 'package:shared_preferences/shared_preferences.dart';



class EditPost extends StatefulWidget {
  const EditPost({Key? key,required this.product}) : super(key: key);
  final Product product;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  int categoryId = 0;
  String currencyValue = 'Currency';
  String periodValue = 'Hour';
  int addressId = 0;
  int userID=0;
  bool isFirstLoad=true;
  String dropdownvalue5 = 'District';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  var sections = [
    'Section',
    'Vehicles',
    'Apartments',
    'Electronics',
    'Tools',
    'Wedding Supplies',
    'Swimming pools',
  ];

  var governorates = [
    'Governorate',
    'Hadhramout',
    'Aden',
    'Al Maharah',
    'Shabwah',
  ];

  var districts = [
    'Al Mukalla',
    'Ash Shihr',
    'Seiyun',
    'Crater',
    'Al-Maala',
    'Shaykh Uthman',
    'Al Ghaydah',
    'Sayhut',
    'Qishn',
    'Ataq',
    'Bayhan',
    'Habban',
    'At Talh',
    'District',
  ];

  var currencies = [
    'Currency',
    'Yemeni Rial',
    'Saudi Rial',
    'Dolar',
  ];

  var period_of_times = [
    'Hour',
    'Day',
    'Week',
    'Month',
    'Year',
    'Period of Time'
  ];

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  // void getDate()async{
  //   var prefs=await SharedPreferences.getInstance();
  //   userID=prefs.getInt('userid')??0;
  // }
  // void initState() {
  //   getDate();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    if(isFirstLoad){
      isFirstLoad=false;
      titleController.text=widget.product.title;
      descriptionController.text=widget.product.description;
      priceController.text=widget.product.price.toString();
       categoryId = widget.product.categoryId;
       currencyValue = widget.product.currency;
       periodValue = widget.product.periodOfTime;
       addressId = widget.product.addressId;
       userID=widget.product.userId;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Post'),
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
            children: [
              FutureBuilder<List<Category>>(
                future: CategotyController.fetchAllCategories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Category>> snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: 240,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  width: 3, color: Colors.deepPurple)),
                        ),
                        value: categoryId,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: [
                          for (var i in snapshot.data!)
                            DropdownMenuItem(
                              value: i.categoryID,
                              child: Text(i.category),
                            ),
                        ],
                        onChanged: (v) {
                          print(v);
                          categoryId = v as int;
                        },
                      ),
                    );
                  } else
                    return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 30),
              TextField(
                controller: titleController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  fillColor: Color.fromRGBO(63, 63, 156, 1),
                  filled: true,
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Description...",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  fillColor: Color.fromRGBO(63, 63, 156, 1),
                  filled: true,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
              ),
              SizedBox(height: 10),
              TextField(
                controller: priceController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  fillColor: Color.fromRGBO(63, 63, 156, 1),
                  filled: true,
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 240,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(63, 63, 156, 1))),
                  ),
                  value: currencyValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: currencies.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      currencyValue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 240,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(63, 63, 156, 1))),
                  ),
                  value: periodValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: period_of_times.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      periodValue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  openImages();
                },
                child: Text("Upload images",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(90, 70, 178, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Color.fromRGBO(63, 63, 156, 1),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Picked Files:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    imagefiles != null
                        ? Wrap(
                      children: [
                        Container(
                            child: Card(
                              child: Container(
                                height: 100,
                                width: 100,
                                child:
                                Image.file(File(imagefiles?.path ?? '')),
                              ),
                            ))
                      ],
                    )
                        : Container()
                  ],
                ),
              ),
              SizedBox(height: 15),
              FutureBuilder<List<Address>>(
                future: AddressesController.fetchAllAddresses(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Address>> snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      width: 240,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                width: 3,
                                color: Color.fromRGBO(63, 63, 156, 1),
                              )),
                        ),
                        value: addressId,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: [
                          for (var i in snapshot.data!)
                            DropdownMenuItem(
                              value: i.addressID,
                              child: Text(i.governorate),
                            ),
                        ],
                        onChanged: (v) {
                          print(v);
                          addressId = v as int;
                        },
                      ),
                    );
                  } else
                    return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 240,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color.fromRGBO(63, 63, 156, 1),
                        )),
                  ),
                  value: dropdownvalue5,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: districts.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue5 = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(90, 70, 178, 1),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      showDialog(
                          context: context,
                          builder: (context) => Container(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ));
                      bool result=await ProductController.editProduct(
                          Product(
                              productId: widget.product.productId,
                              title: titleController.text,
                              description: descriptionController.text,
                              picsPath: widget.product.picsPath,
                              price:int.parse(priceController.text) ,
                              currency: currencyValue,
                              periodOfTime: periodValue,
                              userId: userID,
                              addressId: addressId,
                              categoryId: categoryId),
                          imagefiles as XFile);
                      Get.back();
                      niceDialog(context, result);
                    },
                    child: Text("UPDATE",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(90, 70, 178, 1),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
