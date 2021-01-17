import 'package:ceria/views/screen_guru/teacher_home_alter.dart';
import 'package:ceria/views/screen_parent/parent_home_alter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class LoginAsViewModel extends BaseViewModel {
  SharedPreferences cookies;

  LoginAsViewModel();

  initial({BuildContext context}) async {
    setBusy(true);
    this.cookies = await SharedPreferences.getInstance();
    setBusy(false);

    var role = this.cookies.getString("role");
    var nomorInduk = this.cookies.getString("nomorInduk");
    print("from login as : $role");
    print("from login as : $nomorInduk");

    if (role != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return role == "parent"
            ? ParentHomeAlter(
                nik: nomorInduk,
              )
            : TeacherHomeAlter(
                nip: nomorInduk,
              );
      }));
    }
  }
}
