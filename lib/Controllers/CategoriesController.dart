import 'dart:convert';
import 'dart:io';
import 'package:dallal/Models/Categories.dart';
import 'package:dallal/constrant.dart';
import 'package:http/http.dart' as http;

class CategotyController {
  static Future<List<Category>> fetchAllCategories() async {
    String Website_Url = '${server.serverUrl}Categories/GetCategory';

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    final http.Response websiteResponse =
        await http.get(Uri.parse(Website_Url), headers: headers);
    print(Website_Url);
    if (websiteResponse.statusCode == 200) {
      print('done');
      final x = getallCategoriesList(websiteResponse.body);
      x.insert(
          0,
          Category(
            categoryID: 0,
            category: 'Choose Section ',
          ));
      return x;
    } else {
      return [];
    }
  }

  static List<Category> getallCategoriesList(responseBody) {
    List<Category> pli = [];
    var json_obj_list = json.decode(responseBody);
    pli = (json_obj_list as List)
        .map<Category>((data) => Category.fromJson(data))
        .toList();
    return pli;
  }
}
