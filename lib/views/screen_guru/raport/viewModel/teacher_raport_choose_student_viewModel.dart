import 'package:ceria/models/raport_teacher/class_detail.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherRaportChooseStudentViewModel extends BaseViewModel {
  final int idKelas;
  ClassDetail classDetail;

  TeacherRaportChooseStudentViewModel({@required this.idKelas});

  initial() async {
    var classDetailUrl = "https://ceriakan.id/api/kelas/$idKelas";

    setBusy(true);
    var response = await http.get(classDetailUrl);
    classDetail = ClassDetail.fromJson(json.decode(response.body));
    print("classDetail student: ${classDetail.students.length}");
    setBusy(false);
    notifyListeners();
  }
}
