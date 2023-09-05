class Category {
  late int categoryID;
  late String category;

  Category({required this.categoryID, required this.category});

  Category.fromJson(Map<String, dynamic> json) {
    categoryID = json['categoryID'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryID'] = this.categoryID;
    data['category'] = this.category;
    return data;
  }
}
