import 'Products.dart';
import 'Users.dart';

class Report {
  late int reportID;
  late int userId;
  late int productId;
  late Product product;
  late User user;

  Report(
      {required this.reportID,
      required this.userId,
      required this.productId,
});

  Report.fromJson(Map<String, dynamic> json) {
    reportID = json['reportID'];
    userId = json['userId'];
    productId = json['productId'];
    product = (json['product'] != null
        ? new Product.fromJson(json['product'])
        : null)!;
    user = (json['user'] != null ? new User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportID'] = this.reportID;
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    return data;
  }
}
