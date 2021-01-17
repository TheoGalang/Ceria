import 'dart:convert';

import 'package:ceria/models/assignments.dart';
import 'package:ceria/models/child.dart';
import 'package:ceria/models/kelas.dart';
import 'package:ceria/views/screen_parent/tugas/widgets/SimpleAssignmentView.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class ParentAssignmentListViewModel extends BaseViewModel {
  String _nis;
  int _idKelas;

  Child _child;
  Kelas _kelas;
  Assigments _assigments;

  String _assignmentsApiUrl;
  String _childApiUrl;

  ParentAssignmentListViewModel({String nis, int idKelas}) {
    this._nis = nis;
    this._idKelas = idKelas;
    this._childApiUrl = "https://ceriakan.id/api/child/$_nis";
    this._assignmentsApiUrl =
        "https://ceriakan.id/api/nis/$_nis/kelas/$_idKelas/assignment";
  }

  initial({BuildContext context}) async {
    // get child by nis
    await getChild();
    // get kelas by id
    await getKelas();
    // get assigments by id
    await getAssignments();
  }

  getChild() async {
    setBusy(true);
    var childReasponse = await http.get(
      _childApiUrl,
    );

    this._child = Child.fromJson(json.decode(childReasponse.body));
    setBusy(false);
    notifyListeners();
  }

  getKelas() async {
    setBusy(true);
    var kelasResponse = await http.get(
      "https://ceriakan.id/api/kelas/${this._idKelas}",
    );

    this._kelas = Kelas.fromJson(json.decode(kelasResponse.body));
    setBusy(false);
    notifyListeners();
  }

  getAssignments() async {
    setBusy(true);
    var assignmetsResponse = await http.get(
      _assignmentsApiUrl,
    );

    this._assigments =
        Assigments.fromJson(json.decode(assignmetsResponse.body));

    setBusy(false);
    notifyListeners();
  }

  List<SimpleAssignmentView> getListAssignmentsView() {
    List<SimpleAssignmentView> temp = [];
    for (var assignment in this._assigments?.data) {
      if (!assignment.isSubmitted) {
        temp.add(SimpleAssignmentView(
          nis: this._child.data.nomorInduk,
          idKelas: this._child.data.idKelas,
          assignment: assignment,
        ));
      }
    }

    return temp;
  }

  List<SimpleAssignmentView> getListAssignmetsDone() {
    List<SimpleAssignmentView> temp = [];
    for (var assignment in this._assigments?.data) {
      if (assignment.isSubmitted) {
        temp.add(SimpleAssignmentView(
          assignment: assignment,
        ));
      }
    }

    return temp;
  }

  Child get child => this._child;
  Kelas get kelas => this._kelas;
  Assigments get assignments => this._assigments;
}
