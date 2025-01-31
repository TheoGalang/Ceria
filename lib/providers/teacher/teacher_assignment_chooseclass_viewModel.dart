import 'dart:convert';

import '../../models/assignments.dart';
import '../../models/classes.dart';
import '../../models/kelas.dart';
import '../../views/screen_guru/tugas/widgets/view_single_class.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class TeacherAssignmentChooseClassViweModel extends BaseViewModel {
  Classes _kelas;
  String _teachersID;
  Assigments _assigments;
  int assigmentNumber = 0;
  var assigment;
  String _urlAPIKelas = "https://ceriakan.id/api/kelas";
  String _urlAPIAssignment = "https://ceriakan.id/api/assignment";
  List<SingleClassView> listKelasView = [];
  List<Kelas> listKelas = [];

  TeacherAssignmentChooseClassViweModel({String teachersID}) {
    this._teachersID = teachersID;
  }

  initial({BuildContext context}) async {
    setBusy(true);

    var kelasResponse = await http.get(this._urlAPIKelas);
    var assignmentResponse = await http.get(this._urlAPIAssignment);

    this._kelas = Classes.fromJson(json.decode(kelasResponse.body));
    this._assigments =
        Assigments.fromJson(json.decode(assignmentResponse.body));

    if (assignmentResponse.statusCode == 200) {
      this.assigmentNumber = 0;
      this.listKelasView = [];
    }

    setBusy(false);

    notifyListeners();

    setBusy(true);

    List<Kelas> temp = [];

    for (var kelas in this._kelas.data) {
      if (kelas.nomorPegawai == this._teachersID) {
        temp.add(Kelas(data: kelas));
      }
    }
    this.listKelas =
        temp; // kelas didapat kan misal ada 2 kelas kelas A dan kelas B

    // looping semua tugas
    for (var assignment in this._assigments.data) {
      if (assignment.idTeacher == this._teachersID &&
          assignment.isVisible == 1) {
        this.assigmentNumber++;
      }
    }

    for (var kelas in this.listKelas) {
      this.listKelasView.add(SingleClassView(
            kelas: kelas,
            id: kelas.data.id,
            assignmentsNumber: this.assigmentNumber,
          ));
    }

    setBusy(false);
    notifyListeners();
  }

  Classes get daftarKelas => this._kelas;
  Assigments get assignments => this._assigments;
}
