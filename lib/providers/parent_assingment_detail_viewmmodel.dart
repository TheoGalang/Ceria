import 'dart:io';

import 'package:ceria/models/assignments.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ParentAssignmentDetailViewModel extends BaseViewModel {
  // properti
  String _nis;
  String _title;
  String _deskrpsi;
  int _idKelas;
  int _idTugas;
  File _file;

  ParentAssignmentDetailViewModel({
    String title,
    String deskripsi,
    int idKelas,
    int idTugas,
    String nis,
  }) {
    this._nis = nis;
    this._title = title;
    this._deskrpsi = deskripsi;
    this._idKelas = idKelas;
    this._idTugas = idTugas;
    this._file = null;
  }

  getFileFromDevice() async {
    setBusy(true);

    setBusy(false);
  }

  // sebelum bisa upload file sediakan
  //  nis, id_kelas, id_tugas,title(title tugas),deskripsi, dan File nya

}
