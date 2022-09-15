import 'package:cached_network_image/cached_network_image.dart';
import 'package:dallal/Controllers/ProductsController.dart';
import 'package:dallal/Models/Products.dart';
import 'package:dallal/Views/Users/Sections.dart';
import 'package:flutter/material.dart';
import 'package:dallal/constrant.dart';

import 'Post_Details.dart';



class  DisplayProducts extends StatefulWidget {
  const DisplayProducts({Key? key,required this.section}) : super(key: key);
  final String section;

  @override
  State<DisplayProducts> createState() => _DisplayProductsState();
}

class _DisplayProductsState extends State<DisplayProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(widget.section.toUpperCase()),
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
      body:FutureBuilder<List<Product>>(
        future: ProductController.fetchAllProductsByCategory(widget.section),
        builder: (BuildContext context,
            AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => MyPost(product: snapshot.data![index])));
                    },
                    child: Card(
                      margin: EdgeInsets.all(5),
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(children: [
                        Container(
                          margin:EdgeInsets.only(left: 8.0),
                          width: 100,
                          height: 100,

                          child:CachedNetworkImage(imageUrl: server.serverUrl.replaceFirst('/api/', '')+ snapshot.data![index].picsPath,
                            useOldImageOnUrlChange: true,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          ),
                        ),
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
                              // Text(snapshot.data[index].ti, style: TextStyle(fontSize: 15)),
                              // SizedBox(height: 10),
                              Container(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data![index].price.toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      snapshot.data![index].currency,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(snapshot.data![index].periodOfTime, style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              Text(snapshot.data![index].dateTime.split('.')[0], style: TextStyle(fontSize: 15)),

                              Text(
                                'انقر للمزيد من التفاصيل',
                                style: TextStyle(fontSize: 15, color: Color.fromRGBO(63, 63, 156, 1)),
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
