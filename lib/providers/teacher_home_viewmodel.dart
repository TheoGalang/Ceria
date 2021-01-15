import 'dart:convert';

import 'package:ceria/models/classes.dart';
import 'package:ceria/models/kelas.dart';
import 'package:ceria/models/teacher_home.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class TeacherHomeViewModel extends BaseViewModel {
  TeachersHome _teacher;
  String _nip;
  String _url;
  List<Kelas> listKelas = [];
  String urlAPIKelas = "https://ceriakan.id/api/kelas";
  TeacherHomeViewModel({String nip}) {
    this._nip = nip;
    this._url = "https://ceriakan.id/api/teacher/$nip";
  }

  initial() async {
    setBusy(true);
    var response = await http.get(
      this._url,
    );

    this._teacher = TeachersHome.fromJson(json.decode(response.body));

    var responseListKelas = await http.get(this.urlAPIKelas);
    var kelas = Classes.fromJson(json.decode(responseListKelas.body));

    for (var kelasdata in kelas.data) {
      if (kelasdata.nomorPegawai == this._nip) {
        DataKelas data = DataKelas(
          id: kelasdata.id,
          kelas: kelasdata.kelas,
          nomorPegawai: kelasdata.nomorPegawai,
          status: kelasdata.status,
          thnAkademik: kelasdata.thnAkademik,
        );
        Kelas itemKelas =
            Kelas(success: true, message: "List kelas", data: data);
        this.listKelas.add(itemKelas);
      }
    }
    setBusy(false);

    notifyListeners();
  }

  TeachersHome get teacher => this._teacher;
}
