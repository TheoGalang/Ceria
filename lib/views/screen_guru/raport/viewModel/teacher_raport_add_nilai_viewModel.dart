import 'package:ceria/models/raport_teacher/indicators.dart';
import 'package:ceria/models/raport_teacher/sub_tema.dart';
import 'package:flutter/material.dart';

import '../../../../models/raport_teacher/tema.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../teacher_add_nilai.dart';

class TeacherRaportAddNilaiViewModel extends BaseViewModel {
  Tema tema;
  SubTema subTema;
  Indicators indicators;

  TeacherRaportAddNilaiViewModel();
  initial({BuildContext context}) async {
    // get semua tema dari api
    var temaUrl = 'https://ceriakan.id/api/tema';
    setBusy(true);
    var result = await http.get(temaUrl);
    tema = Tema.fromJson(json.decode(result.body));
    setBusy(false);
    notifyListeners();
  }

  getSubTema(int temaIDforSubTema) async {
    // get subtema dari api
    var subTemaUrl = 'https://ceriakan.id/api/subtema/tema/$temaIDforSubTema';
    setBusy(true);
    var resultSubTema = await http.get(subTemaUrl);
    subTema = SubTema.fromJson(json.decode(resultSubTema.body));
    print(resultSubTema.body);

    setBusy(false);
    notifyListeners();
  }

  getIndikator({@required int idTema, @required int idSubTema}) async {
    // get list indicator dari api
    var indicatorUrl =
        'https://ceriakan.id/api/tema/$idTema/subtema/$idSubTema/indicator';
    setBusy(true);
    var result = await http.get(indicatorUrl);
    indicators = Indicators.fromJson(json.decode(result.body));
    print("idtema: $idTema, idSubTema: $idSubTema");
    print(result.body);

    print("indicators");
    print(indicators.data.length);
    setBusy(false);
    notifyListeners();
  }

  // function to post nilai baru to api,
  // return true or false
  Future<bool> createNilai(
      {@required String nilai,
      @required int idTema,
      @required int idSubTema,
      @required int idIndikator,
      @required String nis}) async {
    var addNilai = 'https://ceriakan.id/api/raport/store';
    setBusy(true);
    var result = await http.post(
      addNilai,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nilai': nilai,
        'id_tema': idTema,
        'id_subtema': idSubTema,
        'date_created': DateTime.now().toString(),
        'nis': nis,
        'id_indicator': idIndikator,
      }),
    );

    print(result.body);
    setBusy(false);
    notifyListeners();
    if (result.statusCode == 200) return true;
    return false;
  }

  Future<bool> postManyNilai(
      {List<Nilai> values, int idTema, int idSubTema, String nis}) async {
    var status = true;
    for (var nilai in values) {
      status = status &&
          await createNilai(
              nilai: nilai.nilai,
              idTema: idTema,
              idSubTema: idSubTema,
              idIndikator: nilai.id,
              nis: nis);
    }
    return status;
  }
}
