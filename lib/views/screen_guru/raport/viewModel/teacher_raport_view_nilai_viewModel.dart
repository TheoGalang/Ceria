import 'package:ceria/models/raport_teacher/indicators.dart';
import 'package:ceria/models/raport_teacher/nilai_raport.dart';
import 'package:ceria/models/raport_teacher/sub_tema.dart';
import 'package:ceria/models/raport_teacher/tema.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherRaportViewNilaiViewModel extends BaseViewModel {
  final String date;
  final String nis;
  Tema tema;
  SubTema subTema;
  NilaiRaport nilai;
  Indicators indikator;

  TeacherRaportViewNilaiViewModel({this.date, this.nis});

  initial() async {
    setBusy(true);
    // get tema
    getTema();
    // get subTema

    // get nilai by date and nis
    getNilai();

    setBusy(false);
    notifyListeners();
  }

  // get tema
  getTema() async {
    setBusy(true);
    var temaUrl = 'https://ceriakan.id/api/tema';
    var result = await http.get(temaUrl);
    tema = Tema.fromJson(json.decode(result.body));
    setBusy(false);
    notifyListeners();
  }

  // get subTema
  getSubTema() async {
    var subTemaUrl = 'https://ceriakan.id/api/subtema/';
    setBusy(true);
    var resultSubTema = await http.get(subTemaUrl);
    subTema = SubTema.fromJson(json.decode(resultSubTema.body));
    print(resultSubTema.body);

    setBusy(false);
    notifyListeners();
  }

  // get nilai by date and nis
  getNilai() async {
    var nilaiUrl = 'https://ceriakan.id/api/raport/nis/$nis/date/$date';
    setBusy(true);
    var resultNilai = await http.get(nilaiUrl);
    nilai = NilaiRaport.fromJson(json.decode(resultNilai.body));
    print(resultNilai.body);

    setBusy(false);
    notifyListeners();
  }

  // get indikator
  getIndikator({
    int idTema,
    int idSubTema,
  }) async {
    var urlIndikator =
        "https://ceriakan.id/api/tema/$idTema/subtema/$idSubTema/indicator";

    setBusy(true);
    var response = await http.get(urlIndikator);
    this.indikator = Indicators.fromJson(json.decode(response.body));
    print("getindikator nilai viewmodel : ${response.body}");
    setBusy(false);
    notifyListeners();
  }
}
