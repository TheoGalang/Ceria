import 'dart:convert';

import 'package:ceria/models/teacher_home.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class TeacherHomeViewModel extends BaseViewModel {
  TeachersHome _teacher;
  String _nip;
  String _url;
  TeacherHomeViewModel({String nip}) {
    this._nip = nip;
    this._url = "https://ceriakan.id/api/teacher/$nip";
  }

  initial() async {
    setBusy(true);
    var response = await http.get(
      this._url,
    );

    print(response.body);

    this._teacher = TeachersHome.fromJson(json.decode(response.body));

    setBusy(false);

    notifyListeners();
  }

  TeachersHome get teacher => this._teacher;
}
