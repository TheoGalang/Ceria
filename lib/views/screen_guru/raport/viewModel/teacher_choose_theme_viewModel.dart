import 'package:ceria/models/raport_teacher/sub_tema.dart';
import 'package:flutter/material.dart';

import '../../../../models/raport_teacher/tema.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherRaportChooseThemeViewModel extends BaseViewModel {
  Tema tema;
  SubTema subTema;

  TeacherRaportChooseThemeViewModel();
  initial({BuildContext context}) async {
    // get tema dari api
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
}
