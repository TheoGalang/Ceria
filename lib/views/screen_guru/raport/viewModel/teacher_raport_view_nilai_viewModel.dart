import 'package:ceria/models/raport_teacher/indicators.dart';
import 'package:ceria/models/raport_teacher/nilai_raport.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherRaportViewNilaiViewModel extends BaseViewModel {
  final String date;
  final String nis;
  NilaiRaport nilai;
  Indicators indikator;

  TeacherRaportViewNilaiViewModel({this.date, this.nis});

  initial() async {
    setBusy(true);

    // get nilai by date and nis
    await getNilai();

    // fill indicator string in data nilai
    await getStringIndicator(nilai: nilai);

    setBusy(false);
    notifyListeners();
  }

  getStringIndicator({NilaiRaport nilai}) async {
    print("Sedang dalam getStringIndicator");
    for (var dataNilai in nilai.data) {
      String stringIndicator = await getIndikator(
          idTema: dataNilai.idTema,
          idSubTema: dataNilai.idSubtema,
          idIndicator: dataNilai.idIndicator);

      dataNilai.indicator = stringIndicator;
      print(dataNilai.indicator);
    }
  }

  // get nilai by date and nis
  getNilai() async {
    var nilaiUrl = 'https://ceriakan.id/api/raport/nis/$nis/date/$date';
    setBusy(true);
    var resultNilai = await http.get(nilaiUrl);
    nilai = NilaiRaport.fromJson(json.decode(resultNilai.body));
    print(resultNilai.body);

    // filter idTema
    Set<int> setIDTema = {};

    for (var value in nilai.data) {
      setIDTema.add(value.idTema);
    }

    setBusy(false);
    notifyListeners();
  }

  Future<String> getIndikator({
    int idTema,
    int idSubTema,
    int idIndicator,
  }) async {
    var urlIndikator =
        "https://ceriakan.id/api/tema/$idTema/subtema/$idSubTema/indicator";

    setBusy(true);

    var response = await http.get(urlIndikator);
    this.indikator = Indicators.fromJson(json.decode(response.body));

    setBusy(false);
    notifyListeners();

    try {
      return indikator?.data
              ?.where((element) => element.id == idIndicator)
              ?.first
              ?.description ??
          'no data';
    } catch (e) {
      return "Indikator tidak ditemukan";
    }
  }
}
