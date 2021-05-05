import 'package:ceria/models/raport_teacher/tema.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherChooseOptionRaportViewModel extends BaseViewModel {
  Tema tema;
  String latestTema;
  String choosedTemaValue;

  TeacherChooseOptionRaportViewModel();
  initial({BuildContext context}) {
    getTema();
  }

  setChoosedTemaValue(String value) {
    /// kyknya gk guna . .. hehe
    this.choosedTemaValue = value;
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

    notifyListeners();

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Gagal di create subtema");
      return false;
    }
  }

  getTema() async {
    setBusy(true);
    var temaUrl = 'https://ceriakan.id/api/tema';
    var result = await http.get(temaUrl);
    tema = Tema.fromJson(json.decode(result.body));

    // print("""getTema : ${tema?.data.length} """);

    setBusy(false);
    notifyListeners();
  }

  Future<bool> createSubTema(
      {@required String subTema, @required int idTema}) async {
    setBusy(true);
    var subTemaUrl = "https://ceriakan.id/api/subtema/store";

    var response = await http.post(
      subTemaUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': subTema,
        'id_tema': idTema,
      }),
    );
    setBusy(false);
    notifyListeners();
    if (response.statusCode == 200) {
      return true;
    } else {
      print("Gagal di create subtema");
      return false;
    }
  }
}
