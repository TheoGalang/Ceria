import 'package:ceria/models/raport_teacher/raport_history.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ParentChooseHistoryViewModel extends BaseViewModel {
  RaportHistory history;
  String nis;
  ParentChooseHistoryViewModel({@required this.nis});

  initial() async {
    setBusy(true);
    String historyUrl = "https://ceriakan.id/api/raport/nis/$nis/date";
    var response = await http.get(historyUrl);
    history = RaportHistory.fromJson(json.decode(response.body));

    setBusy(false);
    notifyListeners();
  }
}
