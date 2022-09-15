import 'dart:convert';
import 'dart:io';
import 'package:dallal/Models/Addresses.dart';
import 'package:dallal/constrant.dart';
import 'package:http/http.dart' as http;


class AddressesController{
  static Future<List<Address>> fetchAllAddresses() async {
    String Website_Url = '${server.serverUrl}Addresses/GetAddress';

    final  headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final http.Response websiteResponse =
    await http.get(Uri.parse(Website_Url), headers: headers);
    print(Website_Url);
    if (websiteResponse.statusCode == 200) {
      print('done');
      final x = getallAddressesList(websiteResponse.body);
      x.insert(
          0,
          Address(
              addressID: 0,
              governorate: 'Choose ',
              district: ''));
      return x;
    }  else {
      return [];
    }
  }
  static List<Address> getallAddressesList(responseBody) {
    List<Address> pli = [];
    var json_obj_list = json.decode(responseBody);
    pli = (json_obj_list as List)
        .map<Address>((data) => Address.fromJson(data))
        .toList();
    return pli;
  }


}