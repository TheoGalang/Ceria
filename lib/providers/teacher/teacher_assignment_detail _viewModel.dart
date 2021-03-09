import 'dart:convert';

import 'package:ceria/models/submissionCollected.dart';
import 'package:ceria/views/screen_guru/tugas/teacher_assignment_givingscore.dart';
import 'package:ceria/views/screen_parent/tugas/widgets/Assignment.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class TeacherAssignmentDetailViewModel extends BaseViewModel {
  Assignment assignment;
  String nip;
  SharedPreferences cookies;
  String _submissionCollectedAPIUrl;
  SubmissionCollected submissionCollected;

  List<GestureDetector> listPengumpulan = [];

  TeacherAssignmentDetailViewModel({this.assignment});

  initial({BuildContext context}) async {
    this.listPengumpulan = [];
    setBusy(true);

    this.cookies = await SharedPreferences.getInstance();
    this.nip = cookies.getString("nomorInduk");

    // print("cookies nip : $nip");

    this._submissionCollectedAPIUrl =
        "https://ceriakan.id/api/submission/${this.assignment.id}/teacher/${this.nip}/collected";

    var response = await http.get(this._submissionCollectedAPIUrl);
    this.submissionCollected =
        SubmissionCollected.fromJson(json.decode(response.body));

    SubmissionCollected temp = SubmissionCollected(
        message: "Submission Collected", success: true, data: []);

    for (var item in this.submissionCollected.data) {
      if (item.file != null && item.dateCreated != null) {
        temp.data.add(item);
      }
    }
    this.submissionCollected.data = temp.data;

    // print("list submission collected");
    for (var item in this.submissionCollected.data) {
      // print("submission not null: ${item.nama}");
      // print("file https://ceriakan.id/storage/app/${item.file[0].location}");

      this.listPengumpulan.add(widget(
            context: context,
            item: item,
            assignmentTitle: assignment.title,
          ));
    }

    setBusy(false);

    notifyListeners();
  }

  GestureDetector widget(
      {BuildContext context, Data item, String assignmentTitle}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => IsiNilaiTeacher(
                      nip: this.nip,
                      data: item ?? null,
                      assigmentsTitle: assignmentTitle ?? "",
                    ))).then((value) {
          this.initial(context: context);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            item.grade != null
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : SizedBox(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.fromLTRB(35, 0, 25, 0),

                    child: Text(item.nis,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  Text(item.nama,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            item.grade != null
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(item.grade,
                        style: TextStyle(
                          color: Color(0xFF41348C),
                          fontWeight: FontWeight.bold,
                        )))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
