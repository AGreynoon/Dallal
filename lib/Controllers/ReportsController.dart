import 'dart:convert';
import 'dart:io';
import 'package:dallal/Models/Products.dart';
import 'package:dallal/Models/Reports.dart';
import 'package:http/http.dart' as http;
import 'package:dallal/constrant.dart';

class ReportController{
  static Future<bool> post(Report report) async {
    String Website_Url = '${server.serverUrl}Reports/PostReport';
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
    print(Website_Url);
    print(json.encode(report.toJson()));

    final http.Response websiteResponse = await http.post(
      Uri.parse(Website_Url),
      headers: headers,
      body: json.encode(report.toJson()),
    );
    print(websiteResponse.statusCode);

    if (websiteResponse.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Product>> fetchAllReportedProducts() async {
    String Website_Url = '${server.serverUrl}Reports/GetReportedProducts';

    final  headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final http.Response websiteResponse =
    await http.get(Uri.parse(Website_Url), headers: headers);
    print(Website_Url);
    if (websiteResponse.statusCode == 200) {
      print('done');
      final x = getallProductsList(websiteResponse.body);
      return x;
    }  else {
      return [];
    }
  }
  static List<Product> getallProductsList(responseBody) {
    List<Product> pli = [];
    var json_obj_list = json.decode(responseBody);
    pli = (json_obj_list as List)
        .map<Product>((data) => Product.fromJson(data))
        .toList();
    return pli;
  }
}