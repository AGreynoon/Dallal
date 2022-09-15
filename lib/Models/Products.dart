import 'Addresses.dart';
import 'Categories.dart';
import 'Users.dart';

class Product {
 late int productId;
  late String title;
  late String description;
  late String picsPath;
  late int price;
  late String currency;
  late String periodOfTime;
  late String dateTime;
 late int userId;
  late int addressId;
  late bool isBlocked;
 late int categoryId;
 late Category category;
  late Address address;
  late User user;

  Product(
      {required this.productId,
        required this.title,
        required this.description,
        required this.picsPath,
        required this.price,
        required this.currency,
        required this.periodOfTime,
        required this.userId,
        required this.addressId,
        required this.categoryId,
       });

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    title = json['title'];
    description = json['description'];
    picsPath = json['pics_path'];
    price = json['price'];
    currency = json['currency'];
    periodOfTime = json['period_of_time'];
    dateTime=json['dateTime'];
    userId = json['userId'];
    addressId = json['addressId'];
    categoryId = json['categoryId'];
    isBlocked=json['isBlocked'];
    category = (json['category'] != null
        ? new Category.fromJson(json['category'])
        : null)!;
    address =
    (json['address'] != null ? new Address.fromJson(json['address']) : null)!;
    user = (json['user'] != null ? new User.fromJson(json['user']) : null)!;  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['pics_path'] = this.picsPath;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['period_of_time'] = this.periodOfTime;
    data['userId'] = this.userId;
    data['addressId'] = this.addressId;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
