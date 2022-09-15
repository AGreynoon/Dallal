import 'Products.dart';
import 'Users.dart';

class Rate {
  late int rateId;
  late int numberOfStars;
  late int userId;
  late int productId;
  late Product product;
  late User user;

  Rate(
      {required this.rateId,
        required this.numberOfStars,
        required this.userId,
        required this.productId,
        required this.product,
        required this.user});

  Rate.fromJson(Map<String, dynamic> json) {
    rateId = json['rateId'];
    numberOfStars = json['numberOfStars'];
    userId = json['userId'];
    productId = json['productId'];
    product =
    (json['product'] != null ? new Product.fromJson(json['product']) : null)!;
    user = (json['user'] != null ? new User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rateId'] = this.rateId;
    data['numberOfStars'] = this.numberOfStars;
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}