import 'dart:convert';

import '../loginPage.dart';
import '../main.dart';
import '../models/parent_model.dart';
import '../models/teacher_model.dart';
import '../views/screen_guru/teacher_home_alter.dart';
import '../views/screen_parent/parent_home_alter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum Role { parent, teacher }

class LoginViewModel extends BaseViewModel {
  Role role;
  var _user;
  static String loginUrl;
  SharedPreferences cookies;

  LoginViewModel({this.role}) {
    loginUrl = this.role == Role.parent
        ? "https://ceriakan.id/api/parent/login"
        : "https://ceriakan.id/api/teacher/login";
  }

  initial({BuildContext context}) async {
    this.role == Role.parent ? print("parent") : print("teacher");

    this.cookies = await SharedPreferences.getInstance();

    checkConnectivity(
        context: context,
        child: LoginPage(
          role: this.role,
        ));
  }

  login({String username, String password}) async {
    setBusy(true);
    try {
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
    } catch (e) {
      print("Error $e");
      setBusy(false);
    }

    setBusy(false);

    notifyListeners();
  }

  goToHome({BuildContext context}) async {
    this
        .cookies
        .setString("role", this.role == Role.parent ? "parent" : "teacher");

    this.cookies.setString(
        "nomorInduk",
        this.role == Role.parent
            ? this._user.data.nik
            : this._user.data.nomorPegawai);

    // print("role : ${this.cookies.getString("role")}");
    // print("nomorInduk : ${this.cookies.getString("nomorInduk")}");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) {
          return this.role == Role.parent
              ? ParentHomeAlter(
                  nik: this._user.data.nik,
                )
              : TeacherHomeAlter(
                  nip: this._user.data.nomorPegawai,
                );
        },
      ),
    );
  }

  get user => this._user;
}
