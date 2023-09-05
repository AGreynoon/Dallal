// import 'dart:convert';
// import 'dart:io';
//
// import 'package:delivery_app/Models/Users.dart';
// import 'package:delivery_app/Saeed/Change_Password.dart';
// import 'package:delivery_app/services/MyencryptionDecryption.dart';
// import 'package:http/http.dart' as http;
//
// import '../constants.dart';
// import '../user_preferences.dart';
// import 'constantsForControllers.dart';
//
// class UserController {
//   static UserPreferences userPreferences = UserPreferences();
//   static Future<bool> checkUserLoggedInForOrderConfirmation() async {
//     if (userPreferences.prefs.containsKey('userToken'))
//       return true;
//     else
//       return false;
//   }
//
//   // static Future<User> getUserTokenAndId() async {
//   //   return User(
//   //     id: int.parse(userPreferences.prefs.getString('userId')),
//   //     token: userPreferences.prefs.getString('userToken'),
//   //   );
//   // }
//
//   static Future<User> fetchuserByID(int id) async {
//     String Website_Url = '${Server.url}/Users/getusers/$id';
//
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.get(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     if (websiteResponse.statusCode == 200) {
//       print('done');
//       return User.fromJson(json.decode(websiteResponse.body));
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await fetchuserByID(id);
//     } else {
//       return null;
//     }
//   }
//
//   static Future<bool> isUserFirebase(String phone) async {
//     String Website_Url = '${Server.url}/Users/isUserFirebase/$phone';
//     print(Website_Url);
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.get(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     if (websiteResponse.statusCode == 200) {
//       print('done');
//       return json.decode(websiteResponse.body);
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await isUserFirebase(phone);
//     } else {
//       return false;
//     }
//     return false;
//   }
//
//   static Future<bool> isUserExist(String phone) async {
//     String Website_Url = '${Server.url}/Users/isUserExist/$phone';
//     print(Website_Url);
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.post(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     print(websiteResponse.statusCode);
//     if (websiteResponse.statusCode == 200) {
//       print('done');
//       return json.decode(websiteResponse.body);
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await isUserExist(phone);
//     } else {
//       return false;
//     }
//     return false;
//   }
//
//   static Future<List<User>> fetchAllusers() async {
//     String Website_Url = '${Server.url}/Users/GetALLUsers';
//
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.get(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     if (websiteResponse.statusCode == 200) {
//       print('done');
//       final x = getallusersList(websiteResponse.body);
//       return x;
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await fetchAllusers();
//     } else {
//       return null;
//     }
//   }
//
//   static Future<int> getUsersNumber(int userAdminId, String userType) async {
//     String Website_Url =
//         '${Server.url}/Users/GetUsersNumber/$userAdminId/$userType';
//
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.get(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     if (websiteResponse.statusCode == 200) {
//       print('done');
//       return json.decode(websiteResponse.body);
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await getUsersNumber(userAdminId, userType);
//     } else {
//       return null;
//     }
//   }
//
//   static Future<List<User>> fetchAllDisabledUsers() async {
//     String Website_Url = '${Server.url}/Users/GetALLDisabledUsers';
//
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.get(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     if (websiteResponse.statusCode == 200) {
//       final x = getallusersList(websiteResponse.body);
//       return x;
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await fetchAllDisabledUsers();
//     } else {
//       return null;
//     }
//   }
//
//   static Future<List<User>> fetchAllusersBasedOnUserType(String userType,
//       {int pageKey = 0, int pageSize = 0, int userAdminID = 1}) async {
//     if (userAdminID == 1) userAdminID = Server.UserAdminID;
//     String Website_Url =
//         '${Server.url}/Users/GetALLUsersBasedOnUserType/$userType/$pageKey/$pageSize/$userAdminID';
//     print(Website_Url);
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.get(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     if (websiteResponse.statusCode == 200) {
//       print('done');
//       final x = getallusersList(websiteResponse.body);
//       return x;
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await fetchAllusersBasedOnUserType(userType);
//     } else {
//       return null;
//     }
//   }
//
//   static Future<List<User>> fetchAlluserAdmin() async {
//     String Website_Url = '${Server.url}/Users/GetAllUserAdmin';
//     print(Website_Url);
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse =
//     await http.get(Uri.parse(Website_Url), headers: headers);
//     print(Website_Url);
//     if (websiteResponse.statusCode == 200) {
//       print('done');
//       final x = getallusersList(websiteResponse.body);
//       x.insert(0, User(firstName: 'الجميع', id: 0));
//       return x;
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await fetchAlluserAdmin();
//     } else {
//       return null;
//     }
//   }
//
//   static List<User> getallusersList(responseBody) {
//     List<User> pli = [];
//     var json_obj_list = json.decode(responseBody);
//     pli = (json_obj_list as List)
//         .map<User>((data) => User.fromJson(data))
//         .toList();
//     return pli;
//   }
//
//   static saveUser(response) {
//     User user = User.fromJson(json.decode(response));
//     print(user);
//     // userPreferences.prefs.setString("firstName", user.firstName);
//     // userPreferences.prefs.setString("lastName", user.lastName);
//     // userPreferences.prefs.setString("phone", user.phoneNumber);
//     userPreferences.prefs.setString(
//         "firstName", MyencryptDecryption.encryptAES(user.firstName).base64);
//     userPreferences.prefs.setString(
//         "lastName", MyencryptDecryption.encryptAES(user.lastName).base64);
//     // userPreferences.prefs.setString(
//     //     "phone", MyencryptDecryption.encryptAES(user.phoneNumber).base64);
//   }
//
//   static Future editUserData(User user) async {
//     String Website_Url = '${Server.url}/Users/PutUsers/${user.id}';
//     // final headers = {
//     //   HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
//     //   HttpHeaders.authorizationHeader:
//     //       userPreferences.prefs.getString("userToken"),
//     // };
//     print(Website_Url);
//     print(json.encode(user.toJson()));
//     final http.Response websiteResponse = await http.put(
//       Uri.parse(Website_Url),
//       headers: {
//         'Content-Type': 'application/json; charset=utf-8',
//         HttpHeaders.authorizationHeader:
//         userPreferences.prefs.getString("userToken"),
//
//         //if the content type doesn't exist in post it will not execute
//       },
//       body: json.encode(user.toJson()),
//     );
//     print(websiteResponse.body);
//     print(websiteResponse.statusCode);
//     if (websiteResponse.statusCode - 200 < 200) {
//       if (user.id == UserPreferences().getUser().id)
//         saveUser(websiteResponse.body);
//       return true;
//     } else if (websiteResponse.statusCode == 409) {
//       return "Conflict";
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await editUserData(user);
//     }
//     return false;
//     //print(Product(productName: pn,quantity: pq,price: pp).toJson());
//     //print(json.encode(Product(productName: pn,quantity: pq,price: pp).toJson()),););
//   }
//
//   static Future editUserDataByAdmin(User user) async {
//     String Website_Url = '${Server.url}/Users/PutUsersByAdmin/${user.id}';
//     // final headers = {
//     //   HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
//     //   HttpHeaders.authorizationHeader:
//     //       userPreferences.prefs.getString("userToken"),
//     // };
//     print(Website_Url);
//     print(json.encode(user.toJson()));
//     final http.Response websiteResponse = await http.put(
//       Uri.parse(Website_Url),
//       headers: {
//         'Content-Type': 'application/json; charset=utf-8',
//         HttpHeaders.authorizationHeader:
//         userPreferences.prefs.getString("userToken"),
//
//         //if the content type doesn't exist in post it will not execute
//       },
//       body: json.encode(user.toJson()),
//     );
//     print(websiteResponse.body);
//     print(websiteResponse.statusCode);
//     if (websiteResponse.statusCode - 200 < 200) {
//       if (user.id == UserPreferences().getUser().id)
//         saveUser(websiteResponse.body);
//       return true;
//     } else if (websiteResponse.statusCode == 409) {
//       return "Conflict";
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await editUserData(user);
//     }
//     return false;
//     //print(Product(productName: pn,quantity: pq,price: pp).toJson());
//     //print(json.encode(Product(productName: pn,quantity: pq,price: pp).toJson()),););
//   }
//
//   static Future<bool> ChangePass(CH_Password password) async {
//     String Website_Url = '${Server.url}/Users/ChangePass';
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     print(json.encode(password.toJson()));
//     final http.Response websiteResponse = await http.post(
//       Uri.parse(Website_Url),
//       headers: headers,
//       body: json.encode(password.toJson()),
//     );
//     if (websiteResponse.statusCode == 204) {
//       print(websiteResponse.body); //------------ for debugging Only
//       return true;
//     } else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await ChangePass(password);
//     } else {
//       print(websiteResponse.body);
//       print(
//           "Send ${websiteResponse.statusCode}"); //------------ for debugging Only
//
//       return false;
//     }
//   }
//
//   // ---------------------------------------------- DELETE DATA (2) - DELETE Region ----------------------------------------------
//   static Future<bool> deleteUserData(int id) async {
//     String Website_Url = '${Server.url}/Users/DeleteUsers/$id';
//     final headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader:
//       userPreferences.prefs.getString("userToken"),
//     };
//     final http.Response websiteResponse = await http.delete(
//       Uri.parse(Website_Url),
//       headers: headers,
//     );
//     print(websiteResponse.body);
//     print(websiteResponse.statusCode);
//     if (websiteResponse.statusCode - 200 < 200)
//       return true;
//     else if (websiteResponse.statusCode == 401) {
//       var f = await refreshToken();
//       if (f) return await deleteUserData(id);
//     }
//     return false;
//   }
// //------------------------------------------------------------------------------------------------------------
//
// }
