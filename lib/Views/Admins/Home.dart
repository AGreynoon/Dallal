import 'package:cached_network_image/cached_network_image.dart';
import 'package:dallal/Controllers/ProductsController.dart';
import 'package:dallal/Models/Products.dart';
import 'package:dallal/Views/Admins/Reports.dart';
import 'package:dallal/Views/Admins/Post_Details.dart';
import 'package:dallal/Views/Users/Profile.dart';
import 'package:dallal/Views/Admins/Sections.dart';
import 'package:dallal/constrant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomeForAdmin extends StatefulWidget {
  const HomeForAdmin({Key? key}) : super(key: key);

  @override
  State<HomeForAdmin> createState() => _HomeForAdminState();
}

class _HomeForAdminState extends State<HomeForAdmin> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if(_selectedIndex ==0)
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeForAdmin()));
      }
    else if (_selectedIndex ==1)
    {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Sections()));
    }
    else if (_selectedIndex ==2)
    {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Reports()));
    }
    else if (_selectedIndex ==3)
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Profile()));
      }
  });
}
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    );
                },
                icon: Icon(Icons.search))
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        ),
        body: FutureBuilder<List<Product>>(
          future: ProductController.fetchAllProductsAdmin(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Post(product: snapshot.data![index],)));
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
                                        onPressed: () async {
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
                                          bool result=await ProductController.blockOrUnBlockProduct(snapshot.data![index].productId);
                                          if(result)
                                            Get.back();
                                          niceDialog(context, result);
                                          setState(() {

                                          });
                                        },
                                        child: Text(snapshot.data![index].isBlocked?"Unblock":"Block",
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
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromRGBO(90, 70, 178, 1),
          unselectedItemColor: Color.fromRGBO(63, 63, 156, 1),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
                icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Sections',
              icon: Icon(Icons.window),
            ),
            BottomNavigationBarItem(
              label: 'Reports',
              icon: Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apartments',
    'Building tools',
    'Wedding equipment',
    'Cars',
    'Electronics',
    'Vehicles',
    'Bikes',
  ];

  @override
  List<Widget> buildActions(BuildContext context)
  {
    return
      [
      IconButton(
        onPressed: ()
        {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context)
  {
    return IconButton(
      onPressed: ()
      {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context)
  {
    List<String> matchQuery = [];
    for (var product in searchTerms)
    {
      if (product.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index)
      {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    List<String> matchQuery = [];
    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
