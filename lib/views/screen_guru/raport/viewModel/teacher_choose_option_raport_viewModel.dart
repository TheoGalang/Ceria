import 'package:ceria/models/raport_teacher/tema.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherChooseOptionRaportViewModel extends BaseViewModel {
  Tema tema;
  String latestTema;

  TeacherChooseOptionRaportViewModel();
  initial({BuildContext context}) {
    notifyListeners();
  }

  Future<bool> createNewTema({@required String newTema, String subTema}) async {
    latestTema = newTema;
    var createTemaUrl = 'https://ceriakan.id/api/tema/store';
    setBusy(true);
    var response = await http.post(
      createTemaUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{'title': newTema}),
    );
    setBusy(false);

    getLatestTema();

    if (subTema != null) {
      setBusy(true);
      var subTemaUrl = "https://ceriakan.id/api/subtema/store";

      response = await http.post(
        subTemaUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'title': subTema,
          'id_tema': tema?.data[0]?.id ?? 1,
        }),
      );
      setBusy(false);
    }

    notifyListeners();

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Gagal di create subtema");
      return false;
    }
  }

  getLatestTema() async {
    setBusy(true);
    var temaUrl = 'https://ceriakan.id/api/tema';
    var result = await http.get(temaUrl);
    tema = Tema.fromJson(json.decode(result.body));
    var temaChoosed =
        tema.data.where((element) => element.title == latestTema).first;
    tema.data = [temaChoosed];

    print("""getLatestTema : ${tema.data[0].title} ${tema.data[0].id} 
        /n StringLatestTema: $latestTema""");

    setBusy(false);
  }
}
