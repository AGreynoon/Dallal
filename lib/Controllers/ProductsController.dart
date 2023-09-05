import 'dart:io';

import 'package:dallal/Models/Products.dart';
import'package:dallal/Models/Users.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dallal/constrant.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ProductController {
static final dio=Dio();
  Future<dynamic> FetchAlUsers() async {
    final url = "https://localhost:44300/api/Users/Get";
    final data = await http.get(Uri.parse(url));
    if (data.statusCode == 200) {
      var obj = jsonDecode(data.body);
      return obj[0]["title"];
    } else {
      throw Exception("Error!");
    }
  }
  static Future<bool> post(Product product) async {
    String Website_Url = '${server.serverUrl}products/PostProduct';
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
    print(Website_Url);

    final http.Response websiteResponse = await http.post(
      Uri.parse(Website_Url),
      headers: headers,
      body: json.encode(product.toJson()),
    );
    if (websiteResponse.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
  static Future<bool> postProduct(Product product, XFile picture) async {
    // offer.isActive = true;
    String Website_Url = '${server.serverUrl}products/PostProduct';
    final mimeTypeData =
    lookupMimeType(picture.path, headerBytes: [0xFF, 0xD8])?.split('/');

    print(Website_Url);
    print(jsonEncode(product.toJson()));
    // Attach the file in the request
    final file = await http.MultipartFile.fromPath('Picture', picture.path,
        contentType: MediaType(mimeTypeData![0], mimeTypeData[1]));


    print(jsonEncode(product.toJson()) );
    var formData = FormData.fromMap(product.toJson());
    formData.files.addAll([
      MapEntry(
        'picture',
        MultipartFile.fromFileSync(picture.path,
            filename: 'picture.png', contentType: file.contentType),
      ),
    ]);
    print(formData.fields);

    try {
      var response = await dio.post(
        Website_Url,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          validateStatus: (status) {
            print('status $status');
            return true;
          },
        ),
      );

      print(response.data);
      print(response.statusCode);
      if (response.statusCode ==201)
        return true;
      else
        return false;
    } catch (e) {
      //print(e);
      return null!;
    }
  }
static Future<bool> editProduct(Product product, XFile picture) async {
  // offer.isActive = true;
  String Website_Url = '${server.serverUrl}products/PutProduct';
  final mimeTypeData =
  lookupMimeType(picture.path, headerBytes: [0xFF, 0xD8])?.split('/');

  print(Website_Url);
  print(jsonEncode(product.toJson()));
  // Attach the file in the request
  final file = await http.MultipartFile.fromPath('Picture', picture.path,
      contentType: MediaType(mimeTypeData![0], mimeTypeData[1]));


  print(jsonEncode(product.toJson()) );
  var formData = FormData.fromMap(product.toJson());
  formData.files.addAll([
    MapEntry(
      'picture',
      MultipartFile.fromFileSync(picture.path,
          filename: 'picture.png', contentType: file.contentType),
    ),
  ]);
  print(formData.fields);

  try {
    var response = await dio.put(
      Website_Url,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
        validateStatus: (status) {
          print('status $status');
          return true;
        },
      ),
    );

    print(response.data);
    print(response.statusCode);
    if (response.statusCode ==204)
      return true;
    else
      return false;
  } catch (e) {
    //print(e);
    return null!;
  }
}

static Future<List<Product>> fetchAllProducts() async {
  String Website_Url = '${server.serverUrl}products/GetProduct';

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
static Future<List<Product>> fetchAllProductsByTitle(String title) async {
  String Website_Url = '${server.serverUrl}products/GetProductsByTitle/$title';

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
static Future<List<Product>> fetchAllProductsByUserId(int id) async {
  String Website_Url = '${server.serverUrl}products/GetProductByUserId/$id';

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
static Future<List<Product>> fetchAllProductsAdmin() async {
  String Website_Url = '${server.serverUrl}products/GetProductForAdmin';

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
static Future<List<Product>> fetchAllProductsByCategory(String category) async {
  String Website_Url = '${server.serverUrl}products/GetProductsByCategory/$category';

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
static Future<List<Product>> fetchAllProductsByCategoryForAdmin(String category) async {
  String Website_Url = '${server.serverUrl}products/GetProductsByCategoryForAdmin/$category';

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
static Future<bool> blockOrUnBlockProduct(int id) async {
  String Website_Url = '${server.serverUrl}products/BlockOrUnBlockProduct/$id';
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  };
  print(Website_Url);

  final http.Response websiteResponse = await http.put(
    Uri.parse(Website_Url),
    headers: headers,
  );
  print(websiteResponse.statusCode);
  if (websiteResponse.statusCode == 204) {
    return true;
  } else {
    return false;
  }
}
static Future<bool> deleteProduct(int id) async {
  String Website_Url = '${server.serverUrl}products/DeleteProduct/$id';
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  };
  print(Website_Url);

  final http.Response websiteResponse = await http.delete(
    Uri.parse(Website_Url),
    headers: headers,
  );
  if (websiteResponse.statusCode == 204) {
    return true;
  } else {
    return false;
  }
}
}




