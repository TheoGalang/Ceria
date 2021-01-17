import 'dart:convert';

import 'package:ceria/main.dart';
import 'package:ceria/models/child.dart';
import 'package:ceria/models/kelas.dart';
import 'package:ceria/models/parent_model.dart';
import 'package:ceria/views/screen_parent/parent_home_alter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class ParentHomeViewModel extends BaseViewModel {
  String _nik;
  Parent _parent;
  Child _child;
  Kelas _kelas;
  String _parentApiUrl;
  String _childApiUrl;

  ParentHomeViewModel({String nik}) {
    this._nik = nik;
    this._childApiUrl = "https://ceriakan.id/api/child/parent/$_nik";
    this._parentApiUrl = "https://ceriakan.id/api/parent/$_nik";
  }

  initial({BuildContext context}) async {
    // print(" Initialized from ParentHomeViewModel");
    setBusy(true);
    checkConnectivity(context: context, child: ParentHomeAlter(nik: this._nik));

    var response = await http.get(
      _parentApiUrl,
    );

    this._parent = Parent.fromJson(json.decode(response.body));

    var childReasponse = await http.get(
      _childApiUrl,
    );

    this._child = Child.fromJson(json.decode(childReasponse.body));

    // get kelas
    var kelasResponse = await http.get(
      "https://ceriakan.id/api/kelas/${this._child.data.idKelas}",
    );

    this._kelas = Kelas.fromJson(json.decode(kelasResponse.body));

    setBusy(false);

    notifyListeners();
  }

  Parent get parent => this._parent;
  Child get child => this._child;
  Kelas get kelas => this._kelas;
}
