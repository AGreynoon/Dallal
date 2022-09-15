import 'dart:io';

import'package:dallal/Models/Users.dart';
import 'package:dallal/Userpref.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dallal/constrant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {

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
  static Future<String> Register(User user) async {
    String Website_Url = '${server.serverUrl}Users/Register';
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
    var prefs=await SharedPreferences.getInstance();

    print(json.encode(user.toJson()));

    final http.Response websiteResponse = await http.post(
      Uri.parse(Website_Url),
      headers: headers,
      body: json.encode(user.toJson()),
    );
    if (websiteResponse.statusCode == 201) {
      User user=User.fromJson(jsonDecode(websiteResponse.body)) ;
      prefs.setInt('userid',user.userID);
      prefs.setBool('isadmin',user.isAdmin) ;
      prefs.setBool('isactive',user.isActive);
      prefs.setString('fname',user.fname) ;
      prefs.setString('lname',user.lname) ;
      prefs.setString('email',user.email) ;
      prefs.setString('phone',user.phoneNumber) ;
      prefs.setString('whats',user.whatsApp) ;
      prefs.setInt('addressid',user.addressId) ;
      return 'ok';
    } else if(websiteResponse.statusCode==205) {
      return websiteResponse.body;
    }
    else return 'Error';
  }
  static Future<String> Login(User user) async {
    var prefs=await SharedPreferences.getInstance();
    String Website_Url = '${server.serverUrl}Users/Login';
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
    print(json.encode(user.toJson()));

    final http.Response websiteResponse = await http.post(
      Uri.parse(Website_Url),
      headers: headers,
      body: json.encode(user.toJson()),
    );
    if (websiteResponse.statusCode == 200) {
      print(websiteResponse.body);
      User user=User.fromJson(jsonDecode(websiteResponse.body)) ;
      // userPreferences.deleteUser();
      prefs.setInt('userid',user.userID);
      prefs.setBool('isadmin',user.isAdmin) ;
      prefs.setBool('isactive',user.isActive);
      prefs.setString('fname',user.fname) ;
      prefs.setString('lname',user.lname) ;
      prefs.setString('email',user.email) ;
      prefs.setString('phone',user.phoneNumber) ;
      prefs.setString('whats',user.whatsApp) ;
      prefs.setInt('addressid',user.addressId) ;
      // userPreferences.setUser(user);
      // prefs.remove('fname');
      return 'ok';
    } else if(websiteResponse.statusCode==205) {
      return websiteResponse.body;
    }else{
      print(websiteResponse.statusCode);
      return 'error';
    }
  }
  static Future<String> editUser(int id,User user) async {
    var prefs=await SharedPreferences.getInstance();
    String Website_Url = '${server.serverUrl}Users/PutUser/$id';
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
    print(json.encode(user.toJson()));
    print(Website_Url);


    final http.Response websiteResponse = await http.put(
      Uri.parse(Website_Url),
      headers: headers,
      body: json.encode(user.toJson()),
    );
    if (websiteResponse.statusCode == 204) {
      print(websiteResponse.body);
      // userPreferences.deleteUser();
      prefs.setInt('userid',user.userID);
      prefs.setBool('isadmin',user.isAdmin) ;
      prefs.setBool('isactive',user.isActive);
      prefs.setString('fname',user.fname) ;
      prefs.setString('lname',user.lname) ;
      prefs.setString('email',user.email) ;
      prefs.setString('phone',user.phoneNumber) ;
      prefs.setString('whats',user.whatsApp) ;
      prefs.setInt('addressid',user.addressId) ;
      // userPreferences.setUser(user);
      // prefs.remove('fname');
      return 'ok';
    } else if(websiteResponse.statusCode==205) {
      return websiteResponse.body;
    }else{
      print(websiteResponse.statusCode);
      return 'error';
    }
  }

}




