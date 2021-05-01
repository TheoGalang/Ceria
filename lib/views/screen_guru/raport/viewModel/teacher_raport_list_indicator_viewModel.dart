import 'package:ceria/models/raport_teacher/indicators.dart';
import 'package:ceria/models/raport_teacher/sub_tema.dart';
import 'package:flutter/material.dart';

import '../../../../models/raport_teacher/tema.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherRaportIndicator extends BaseViewModel {
  final int idTema;
  final int idSubTema;
  Indicators indicators;

  TeacherRaportIndicator({@required this.idTema, @required this.idSubTema});
  initial({BuildContext context}) async {
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

  Future<bool> createNewIndicator({@required String newIndicator}) async {
    setBusy(true);
    var createIndicatorUrl = "https://ceriakan.id/api/tema/indicator/store";

    var response = await http.post(
      createIndicatorUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'description': newIndicator,
        'id_tema': this.idTema,
        'id_subtema': this.idSubTema,
      }),
    );
    setBusy(false);
    notifyListeners();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
