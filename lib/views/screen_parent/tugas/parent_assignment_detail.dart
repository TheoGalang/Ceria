import 'dart:io';

import 'package:ceria/models/assignments.dart';
import 'package:ceria/providers/parent/parent_assingment_detail_viewmmodel.dart';
import 'package:ceria/views/screen_parent/tugas/parent_assignment_list.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sweetalert/sweetalert.dart';

import './widgets/chat_message.dart';
import 'package:ceria/tools/measure_child.dart';
import 'package:flutter/material.dart';

class DetailTugasParent extends StatefulWidget {
  final Data assignment;
  final String nis;
  final int idKelas;

  const DetailTugasParent({Key key, this.assignment, this.nis, this.idKelas})
      : super(key: key);
  @override
  _DetailTugasParentState createState() => _DetailTugasParentState(
        assignmentData: this.assignment,
      );
}

class _DetailTugasParentState extends State<DetailTugasParent> {
  final Data assignmentData;
  final _inputController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Boleh",
      crossAxisAlignment: CrossAxisAlignment.end,
    ),
    ChatMessage(
      text: "Kalau tidak urut tidak apa apa?",
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
  ];
  bool _isComposing = false;
  bool showModalBottom = false;
  var descriptionSize = Size(0, 207);
  var paintingScreenSize = Size(0, 600);
  var appbarSize = Size(0, 80);
  var tabBarLabelSize = Size(0, 48);

  File _file;
  String _filename;
  // ignore: unused_field
  String _fileExtension = '';
  String _iconUrl;

  _DetailTugasParentState({this.assignmentData});

  Future getImage() async {
    // ignore: deprecated_member_use
    // final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime deadline = DateTime.parse(assignmentData.dueDate);
    var assignmentDescription = Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "${assignmentData.title}",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff41348C),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.circle,
                    color: Color(0xff41348C),
                    size: 15,
                  ),
                ),
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "${assignmentData.title}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.circle,
                    color: Color(0xff41348C),
                    size: 15,
                  ),
                ),
                Text(
                  "Deadline " +
                      DateFormat("EEEE, d MMMM yyyy", "id_ID").format(deadline),
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    var appbar = AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return ShowAssignmentParent(
                  nis: widget.nis,
                  idKelas: widget.idKelas,
                );
              }));
            }
          },
        ),
      ),
      title: Text("Detail Tugas"),
      backgroundColor: Color(0xff41348C),
    );

    return ViewModelBuilder<ParentAssignmentDetailViewModel>.reactive(
      viewModelBuilder: () => ParentAssignmentDetailViewModel(
        nis: widget.nis,
        idKelas: widget.idKelas.toString(),
        idTugas: widget.assignment.id.toString(),
        deskripsi: widget.assignment.title,
        title: widget.assignment.title,
      ),
      onModelReady: (model) {
        // print("Model Ready");
      },
      builder: (_, model, __) => MeasureSize(
        onChange: (Size size) {
          setState(() {
            paintingScreenSize = size;
          });
        },
        child: Scaffold(
          appBar: appbar,
          body: SingleChildScrollView(
            child: Column(
              children: [
                MeasureSize(
                  onChange: (size) {
                    setState(() {
                      descriptionSize = size;
                    });
                  },
                  child: assignmentDescription,
                ),
                // tab layout
                buildDefaultTabController(model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DefaultTabController buildDefaultTabController(
      ParentAssignmentDetailViewModel model) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            MeasureSize(
              onChange: (Size size) {
                setState(() {
                  tabBarLabelSize = size;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                    labelColor: Color(0xff41348C),
                    indicatorColor: Color(0xff41348C),
                    tabs: [
                      Tab(
                        text: "Komentar",
                      ),
                      Tab(text: "Submition")
                    ]),
              ),
            ),
            Container(
              height: paintingScreenSize.height -
                  appbarSize.height -
                  descriptionSize.height -
                  tabBarLabelSize.height,
              child: TabBarView(children: [
                // Below is Views for Comment tab
                Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        reverse: true,
                        itemBuilder: (_, int index) => _messages[index],
                        itemCount: _messages.length,
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Container(
                      child: buildTextInput(context),
                    ),
                  ],
                ),
                // Below is Views for Submition tab
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        padding: EdgeInsets.all(20),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                          ),
                        ]),
                        child: _file == null
                            ? IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Color(0xff41348C),
                                  size: 50,
                                ),
                                onPressed: () async {
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
                                  var filename = file.path.split("/").last;
                                  var fileExtension = filename.split(".").last;
                                  var iconUrl = "";
                                  switch (fileExtension) {
                                    case "pdf":
                                      iconUrl =
                                          "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/pdfs-64.png";
                                      break;
                                    case "png":
                                      iconUrl =
                                          "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/pngs-64.png";
                                      break;
                                    case "jpg":
                                      iconUrl =
                                          "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/jpgs-64.png";
                                      break;
                                    case "mp4":
                                      iconUrl =
                                          "https://cdn4.iconfinder.com/data/icons/file-extensions-1/64/mp4s-64.png";
                                      break;
                                    case "zip":
                                      iconUrl =
                                          "https://cdn3.iconfinder.com/data/icons/file-extension-names-vol-5-3/512/2-64.png";
                                      break;
                                    case "rar":
                                      iconUrl =
                                          "https://cdn3.iconfinder.com/data/icons/file-extension-names-vol-5-3/512/26-64.png";
                                      break;
                                  }

                                  setState(() {
                                    this._file = file;
                                    this._filename = filename;
                                    this._fileExtension = fileExtension;
                                    this._iconUrl = iconUrl;
                                  });
                                },
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  children: [
                                    Image.network(_iconUrl),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("$_filename"),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        onPressed: _file == null
                            ? null
                            : () async {
                                model.idTugas =
                                    widget?.assignment?.id.toString() ?? "";

                                var statusUpload = await model.uploadFile();
                                statusUpload == 200
                                    ? SweetAlert.show(context,
                                        title: "Berhasil",
                                        subtitle: "File berhsil terkirim!",
                                        onPress: (isConfirm) {
                                        // Navigator.pop(context);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ShowAssignmentParent(
                                            nis: widget.nis,
                                            idKelas: widget.idKelas,
                                          );
                                        }));

                                        return isConfirm;
                                      }, style: SweetAlertStyle.success)
                                    : SweetAlert.show(context,
                                        title: "Gagal",
                                        subtitle:
                                            "File gagal terkirim! \n Mohon cek koneksi anda!",
                                        style: SweetAlertStyle.error);
                              },
                        child: Text(
                          model.isBusy ? "Uploading...." : "Submit",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color(0xff41348C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ));
  }

  Row buildTextInput(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ]),
            child: TextField(
              onChanged: (String text) {
                setState(() {
                  _isComposing = text.length > 0;
                });
              },
              controller: _inputController,
              onSubmitted: _isComposing ? _handleSubmit : null,
              decoration: InputDecoration(
                  hintText: "ketik disini",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.send,
              color: _isComposing ? Color(0xff41348C) : Color(0x7741348C),
              size: 30,
            ),
            onPressed: () {
              // ignore: unnecessary_statements
              _isComposing ? _handleSubmit(_inputController.text) : null;
            })
      ],
    );
  }

  void _handleSubmit(String value) {
    _inputController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
      text: value,
      crossAxisAlignment: CrossAxisAlignment.start,
    );

    setState(() {
      _messages.insert(0, message);
    });
  }
}
