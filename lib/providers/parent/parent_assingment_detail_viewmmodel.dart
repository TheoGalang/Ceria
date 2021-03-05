import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

class ParentAssignmentDetailViewModel extends BaseViewModel {
  // properti
  String _nis;
  String _title;
  String _deskripsi;
  String _idKelas;
  String idTugas;
  File _file;

  ParentAssignmentDetailViewModel({
    String title,
    String deskripsi,
    String idKelas,
    String idTugas,
    String nis,
  }) {
    this._nis = nis;
    this._title = title;
    this._deskripsi = deskripsi;
    this._idKelas = idKelas;
    this.idTugas = idTugas;
    this._file = null;
  }

  // sebelum bisa upload file sediakan
  //  nis, id_kelas, id_tugas,title(title tugas),deskripsi, dan File nya
  set file(File file) {
    this._file = file;
  }

  set title(String title) {
    this._title = title;
  }

  set nis(String nis) {
    this._nis = nis;
  }

  set idKelas(String idKelas) {
    this._idKelas = idKelas;
  }

  set deskripsi(String deskripsi) {
    this._deskripsi = deskripsi;
  }

  File get file => this._file;

  uploadFile() async {
    String fileName = this._file.path.split("/").last;
    // print("file base name:$fileName");

    try {
      setBusy(true);
      FormData formData = new FormData.fromMap({
        "id_kelas": this._idKelas,
        "id_assignment": this.idTugas,
        "user_update": this._nis,
        "title": this._title,
        "description": this._deskripsi,
        "lampiran":
            await MultipartFile.fromFile(this._file.path, filename: fileName),
      });

      Response response = await Dio()
          .post("https://ceriakan.id/api/submission/store", data: formData);

      setBusy(false);
      return response.statusCode;
    } catch (e) {
      print("expectation Caugch: $e");
    }

    return 400;
  }
}
