class Address {
  late int addressID;
  late String governorate;
  late String district;

  Address({required this.addressID, required this.governorate, required this.district});

  Address.fromJson(Map<String, dynamic> json) {
    addressID = json['addressID'];
    governorate = json['governorate'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressID'] = this.addressID;
    data['governorate'] = this.governorate;
    data['district'] = this.district;
    return data;
  }
}
