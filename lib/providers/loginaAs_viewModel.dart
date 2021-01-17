import 'package:ceria/views/screen_guru/teacher_home_alter.dart';
import 'package:ceria/views/screen_parent/parent_home_alter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class LoginAsViewModel extends BaseViewModel {
  SharedPreferences cookies;

  LoginAsViewModel();

  initial({BuildContext context}) async {
    setBusy(true);
    this.cookies = await SharedPreferences.getInstance();

    var connectivityResult = await (Connectivity().checkConnectivity());
    setBusy(false);

    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print("Mobile Network");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      print("Wifi");
    } else if (connectivityResult == ConnectivityResult.none) {
      print("Offline");
    }

    var role = this.cookies.getString("role");
    var nomorInduk = this.cookies.getString("nomorInduk");

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
