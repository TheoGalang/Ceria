import 'package:ceria/models/raport_teacher/kelas.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherRaportChooseClassViewModel extends BaseViewModel {
  final String nip;
  Kelas kelas;
  TeacherRaportChooseClassViewModel({@required this.nip});

  initial() async {
    // get list of class
    var kelasUrl = "https://ceriakan.id/api/kelas/teacher/$nip";
    setBusy(true);
    var response = await http.get(kelasUrl);
    kelas = Kelas.fromJson(json.decode(response.body));
    print("Kelas pada raport : ${kelas.data.length}");
    setBusy(false);
    notifyListeners();
  }
}
