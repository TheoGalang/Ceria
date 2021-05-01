import 'dart:io';
import '../../../providers/teacher/teacher_assignment_add_viewModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:sweetalert/sweetalert.dart';

class AddAssignmentTugas extends StatefulWidget {
  final int id;
  final int idKelas;
  final String idTeacher;

  const AddAssignmentTugas({this.id, this.idKelas, this.idTeacher});
  @override
  _AddAssignmentTugasState createState() => _AddAssignmentTugasState();
}

class _AddAssignmentTugasState extends State<AddAssignmentTugas> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  String title, desc;

  DateTime selectedDate = DateTime.now();
  DateTime oldTime = DateTime.now();

  bool isLoad = false;

  File _file;

  // ignore: unused_field
  String _fileExtension;

  String _filename;

  String _iconUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String dateText =
        DateFormat("EEEE, d MMMM yyyy", "id_ID").format(selectedDate);
    String hour = DateFormat("HH").format(selectedDate);
    String minute = DateFormat("mm").format(selectedDate);
    String time = "$hour:$minute WIB, ";

    return ViewModelBuilder<TeacherAssignmentAddViewModel>.reactive(
      viewModelBuilder: () => TeacherAssignmentAddViewModel(),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  children: <Widget>[
                    assignmentTitleTextField(context),
                    assignmentDescTextField(context),
                    datePicker(context, dateText, time),

                    // Tampilan File Picker
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              // jika ada file maka tampilkan cardfile

                              this._file == null
                                  ? Container(
                                      margin: EdgeInsets.only(top: 12),
                                      child: GestureDetector(
                                        onTap: () async {
                                          var file = await FilePicker.getFile(
                                            type: FileType.custom,
                                            allowedExtensions: [
                                              'jpg',
                                              'pdf',
                                              'png',
                                              'rar',
                                              'zip',
                                              'mp4'
                                            ],
                                          );
                                          model.file = file;
                                          var filename =
                                              file.path.split("/").last;
                                          model.filename = filename;
                                          var fileExtension =
                                              filename.split(".").last;
                                          var iconUrl = "";
                                          switch (fileExtension) {
                                            case "pdf":
                                              iconUrl =
                                                  "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/pdfs-32.png";
                                              break;
                                            case "png":
                                              iconUrl =
                                                  "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/pngs-32.png";
                                              break;
                                            case "jpg":
                                              iconUrl =
                                                  "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/jpgs-32.png";
                                              break;
                                            case "mp4":
                                              iconUrl =
                                                  "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/mp4s-32.png";
                                              break;
                                            case "zip":
                                              iconUrl =
                                                  "https://cdn3.iconfinder.com/data/icons/file-extension-names-vol-5-3/512/2-32.png";
                                              break;
                                            case "rar":
                                              iconUrl =
                                                  "https://cdn3.iconfinder.com/data/icons/file-extension-names-vol-5-3/512/26-32.png";
                                              break;
                                          }

                                          setState(() {
                                            this._file = file;
                                            this._filename = filename;
                                            this._fileExtension = fileExtension;
                                            this._iconUrl = iconUrl;
                                          });
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.grey[300],
                                            ),
                                            width: double.infinity,
                                            padding: EdgeInsets.all(8),
                                            child: Icon(
                                              Icons.add,
                                              size: 50,
                                              color: Colors.grey[600],
                                            )),
                                      ),
                                    ) // akhir button add file

                                  : Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 0,
                                        vertical: 4,
                                      ),
                                      padding: EdgeInsets.all(8),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.teal[200],
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 15,
                                              spreadRadius: 3,
                                              color: Colors.black26)
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12),
                                                    child: Image.network(
                                                        _iconUrl)),
                                                Flexible(
                                                    flex: 1,
                                                    child: Text(_filename)),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () {
                                                print("item   dihapus");
                                                setState(() {
                                                  _file = null;
                                                });
                                              })
                                        ],
                                      ),
                                    ),

                              //akhir dari list file yang telah didapatkan
                            ],
                          ),
                        ],
                      ),
                    ),

                    buttonSave(model: model),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget datePicker(BuildContext context, String dateText, String time) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Deadline/Tenggat Waktu : ",
              style: TextStyle(
                color: Color(0xff41348c),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                padding: EdgeInsets.all(0),
                color: Color(0xff41348c),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      " Deadline",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime.now().add(
                        Duration(days: 365),
                      ), onChanged: (date) {
                    selectedDate = date;
                    setState(() {});
                  }, onConfirm: (date) {
                    // print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.id);
                },
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("$time"),
                      Text("$dateText"),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Container buttonSave({TeacherAssignmentAddViewModel model}) {
    return Container(
      margin: EdgeInsets.all(30),
      child: RaisedButton(
        onPressed: () async {
          if (title != null && desc != null && selectedDate != oldTime) {
            setState(() {});

            model.title = title;
            model.description = desc;
            model.dueDate = selectedDate.toString();
            model.createdDate = DateTime.now().toString();
            model.isVisible = true;
            model.idkelas = widget.idKelas;
            model.nip = widget.idTeacher;
            model.subject = "";
            model.isVisible = true;

            setState(() {
              isLoad = true;
            });

            this.isLoad == true
                ? SweetAlert.show(context,
                    title: "Uploading...", style: SweetAlertStyle.loading)
                : print("notLoading");

            await model.createAssignment();

            setState(() {
              isLoad = false;
            });

            model.isCreated
                ? SweetAlert.show(context,
                    title: "Berhasil",
                    // ignore: missing_return
                    subtitle: "Tugas baru telah dibuat!", onPress: (confirm) {
                    Navigator.pop(context);
                  }, style: SweetAlertStyle.success)
                : SweetAlert.show(context,
                    title: "Upps!!",
                    subtitle: "Terjadi kesalahan, silahkan coba lagi",
                    style: SweetAlertStyle.error);
          } else {
            SweetAlert.show(context,
                title: "Error",
                subtitle: "Lengkapi data yang diperluan!",
                style: SweetAlertStyle.error);
          }
        },
        child: Text(
          "Simpan",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Color(0xff41348C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Container assignmentDescTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.2,
      child: TextField(
        controller: descController,
        onChanged: (value) {
          desc = value;
          setState(() {});
        },
        maxLines: 5,
        decoration: InputDecoration(
            hintText: "Deskripsi Tugas",
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }

  Container assignmentTitleTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.2,
      child: TextField(
        decoration: InputDecoration(
            hintText: "Judul Tugas",
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        onChanged: (value) {
          title = value;
          setState(() {});
        },
        controller: titleController,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          {
            Navigator.pop(context);
          }
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text("Tambah Tugas"),
      backgroundColor: Color(0xff41348C),
    );
  }
}

class FileWithDescription {
  File file;
  String filename;
  String fileExtension;
  String iconUrl;

  FileWithDescription({
    this.file,
    this.filename,
    this.fileExtension,
    this.iconUrl,
  });
}
