import 'dart:convert';

import 'package:ceria/models/parent_model.dart';
import 'package:ceria/models/teacher_model.dart';
import 'package:ceria/screen_guru/teacher_home.dart';
import 'package:ceria/screen_parent/parent_home.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum Role { parent, teacher }

class LoginViewModel extends BaseViewModel {
  Role role;
  var _user;
  static String loginUrl;
  LoginViewModel({this.role}) {
    loginUrl = this.role == Role.parent
        ? "https://ceriakan.id/api/parent/login"
        : "https://ceriakan.id/api/teacher/login";
  }

  initial() {
    this.role == Role.parent ? print("parent") : print("teacher");
  }

  login({String username, String password}) async {
    setBusy(true);
    var response = await http.post(
      loginUrl,
      body: {
        "username": username,
        "password": password,
      },
    );

    this._user = this.role == Role.parent
        ? Parent.fromJson(json.decode(response.body))
        : Teacher.fromJson(json.decode(response.body));

    setBusy(false);

    notifyListeners();
  }

  goToHome({BuildContext context}) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return this.role == Role.parent
          ? HomeParent(
              nik: this._user.data.nik,
            )
          : Home();
    }));
  }

  get user => this._user;
}
