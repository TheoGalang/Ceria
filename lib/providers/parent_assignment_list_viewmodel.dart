import 'dart:convert';

import 'package:ceria/models/assignments.dart';
import 'package:ceria/models/child.dart';
import 'package:ceria/models/kelas.dart';
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

  initial() async {
    print(" Initialized from ParentHomeViewModel");
    setBusy(true);

    // get child by nis
    var childReasponse = await http.get(
      _childApiUrl,
    );

    this._child = Child.fromJson(json.decode(childReasponse.body));

    // get kelas by id
    var kelasResponse = await http.get(
      "https://ceriakan.id/api/kelas/${this._idKelas}",
    );

    this._kelas = Kelas.fromJson(json.decode(kelasResponse.body));

    // get kelas by id
    var assignmetsResponse = await http.get(
      _assignmentsApiUrl,
    );

    this._assigments =
        Assigments.fromJson(json.decode(assignmetsResponse.body));

    setBusy(false);

    notifyListeners();
  }

  Child get child => this._child;
  Kelas get kelas => this._kelas;
  Assigments get assignments => this._assigments;
}
