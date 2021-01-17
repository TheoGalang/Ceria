import 'dart:convert';

import 'package:ceria/models/assignments.dart';
import 'package:ceria/models/kelas.dart';
import 'package:ceria/views/screen_guru/tugas/widgets/view_assignment_teacher.dart';
import 'package:ceria/views/screen_parent/tugas/widgets/Assignment.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class TeacherAssignmentListViewModel extends BaseViewModel {
  String teachersID;
  Assigments listAssignment;
  Kelas kelas;
  String _assigmentAPIUrl = "https://ceriakan.id/api/assignment";
  List<TeacherSimpleAssignmentView> assingmentNotDoneYet = [];

  TeacherAssignmentListViewModel({this.teachersID, this.kelas});

  initial({BuildContext context}) async {
    setBusy(true);

    var response = await http.get(this._assigmentAPIUrl);

    this.listAssignment = Assigments.fromJson(json.decode(response.body));

    Assigments temp = Assigments(success: true, data: []);
    for (var assignment in listAssignment.data) {
      if (assignment.isVisible == 1 &&
          assignment.idTeacher == this.teachersID) {
        temp.data.add(assignment);
      }
    }
    this.listAssignment = temp;

    // fill the assignment list view
    for (var assignment in this.listAssignment.data) {
      this.assingmentNotDoneYet.add(TeacherSimpleAssignmentView(
            assignment: Assignment(
              id: assignment.id,
              title: assignment.title,
              deadline: DateTime.parse(assignment.dueDate),
              attachmentFile: null,
              description: assignment.description,
            ),
            classId: this.kelas.data.id,
            namaKelas: this.kelas.data.kelas,
          ));
    }

    setBusy(false);
    notifyListeners();
  }
}
