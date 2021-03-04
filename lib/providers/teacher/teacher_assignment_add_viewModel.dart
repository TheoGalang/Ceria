import 'package:ceria/views/screen_guru/tugas/teacher_assignment_add.dart';
import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

class TeacherAssignmentAddViewModel extends BaseViewModel {
  String title;
  String description;
  String subject;
  String dueDate;
  List<MultipartFile> lampiran = [];
  List<FileWithDescription> filesWithDescription = [];
  String createdDate;
  String nip;
  int idkelas;
  bool isVisible;

  FormData tformData;

  String createAssignmentUrl;
  bool isCreated = false;

  TeacherAssignmentAddViewModel();

  void initial() {
    // do the initial task
    createAssignmentUrl = "https://ceriakan.id/api/assignment/store";
    this.tformData = FormData();
  }

  Future<void> assignMultiFilesData() async {
    print("panjang lampiran sebelum di assign : ${this.lampiran.length}");

    List<MultipartFile> tempFiles = List<MultipartFile>();

    for (var item in filesWithDescription) {
      MultipartFile temp =
          await MultipartFile.fromFile(item.file.path, filename: item.filename);
      tempFiles.add(temp);
    }

    this.lampiran = tempFiles;

    print("panjang lampiran setelah di assign : ${this.lampiran.length}");
  }

  // create task through API
  Future<void> createAssignment() async {
    setBusy(true);

    FormData formData = FormData.fromMap({
      "title": this.title,
      "description": this.description,
      "subject": this.subject ?? "",
      "due_date": this.dueDate,
      "date_created": this.createdDate ?? DateTime.now().toString(),
      "id_teacher": this.nip ?? "",
      "id_kelas": this.idkelas ?? "",
      "isVisible": this.isVisible ?? true,
      "lampiran": this.lampiran[0],
    });

    // tformData.fields.add(MapEntry("title", this.title));
    // tformData.fields.add(MapEntry("description", this.description));
    // tformData.fields.add(MapEntry("subject", this.subject));
    // tformData.fields.add(MapEntry("due_date", this.dueDate));
    // tformData.fields.add(MapEntry("date_created", this.createdDate));
    // tformData.fields.add(MapEntry("id_teacher", this.nip));
    // tformData.fields.add(MapEntry("id_kelas", this.idkelas.toString()));
    // tformData.fields.add(MapEntry("isVisible", this.isVisible.toString()));

    // print("lampiran length: ${tformData.files.length}");

    Response response =
        await Dio().post(this.createAssignmentUrl, data: formData);
    this.isCreated = response.statusCode == 200 ? true : false;
    setBusy(false);

    notifyListeners();
  }
}
