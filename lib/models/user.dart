import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String nik;
  String username;
  String nama;
  bool isLogin = false;
  String role;

  User({this.nik, this.username, this.nama, this.isLogin, this.role});

  factory User.createUser(Map<String, dynamic> object, bool isLogin) {
    return User(
      nik: object["nik"],
      username: object["username"],
      nama: object["nama"],
      role: object["role"],
      isLogin: isLogin,
    );
  }

  static Future<User> login(
      {String username, String password, String role}) async {
    String apiUrl = "https://ceriakan.id/api/" + role + "/login";

    var dataMentahan = await http
        .post(apiUrl, body: {"username": username, "password": password});
    var dataJson = jsonDecode(dataMentahan.body);

    return dataJson["success"]
        ? User.createUser(dataJson["data"], dataJson["success"])
        : User(
            nama: null,
            isLogin: false,
            nik: null,
            username: null,
            role: null,
          );
  }
}
