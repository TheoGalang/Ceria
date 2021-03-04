import 'dart:io';

import 'package:ceria/views/screen_guru/tugas/teacher_assignment_add.dart';
import 'package:dio/dio.dart';
// import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class TeacherAssignmentAddViewModel extends BaseViewModel {
  String title;
  String description;
  String subject;
  String dueDate;
  String createdDate;
  String nip;
  int idkelas;
  bool isVisible = true;
  String createAssignmentUrl;
  bool isCreated = false;
  File file;
  String filename;

  TeacherAssignmentAddViewModel();

  get fileName => this.filename;

  void initial() {
    // do the initial task
    createAssignmentUrl = "https://ceriakan.id/api/assignment/store";
  }

  // create task through API
  createAssignment() async {
    try {
      setBusy(true);

      FormData formData = FormData.fromMap({
        "title": this.title ?? "title",
        "description": this.description ?? "no description",
        "due_date": this.dueDate,
        "date_created": this.createdDate ?? DateTime.now().toString(),
        "id_teacher": this.nip ?? "",
        "id_kelas": this.idkelas ?? "",
        "is_visible": this.isVisible ? 1 : 0,
        "lampiran": this.file != null
            ? await MultipartFile.fromFile(this.file.path,
                filename: this.fileName)
            : null,
      });

      Response response = await Dio()
          .post("https://ceriakan.id/api/assignment/store", data: formData);

      if (response.statusCode == 500) print("gagal");
      this.isCreated = response.statusCode == 200 ? true : false;
      setBusy(false);

      notifyListeners();
    } catch (e) {
      print("expectation Caugch: $e");
    }
  }
}
