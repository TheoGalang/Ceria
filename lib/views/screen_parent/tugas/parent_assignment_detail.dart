import 'dart:io';

import 'package:ceria/models/assignments.dart';
import 'package:ceria/providers/parent_assingment_detail_viewmmodel.dart';
import 'package:image_picker/image_picker.dart';
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
  var descriptionSize = Size(0, 207);
  var paintingScreenSize = Size(0, 600);
  var appbarSize = Size(0, 80);
  var tabBarLabelSize = Size(0, 48);

  File _image;

  _DetailTugasParentState({this.assignmentData});

  Future getImage() async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
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
              Navigator.pop(context);
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
        idKelas: widget.idKelas,
        idTugas: widget.assignment.id,
        deskripsi: widget.assignment.title,
        title: widget.assignment.title,
      ),
      onModelReady: (model) {
        print("Model Ready");
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
                        child: _image == null
                            ? IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Color(0xff41348C),
                                  size: 50,
                                ),
                                onPressed: () {
                                  // getImage();
                                  model?.getFileFromDevice();
                                })
                            : Container(
                                width: 100,
                                // child: Image.file(_image),
                              ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        onPressed: _image == null
                            ? null
                            : () {
                                //  TODO : Send FIle to Server
                                // when file get from user device and  this button was cliced
                                //  then send file to server
                                //  get the response

                                //  if response success ,
                                //  then shows success alert

                                SweetAlert.show(context,
                                    title: "Berhasil",
                                    subtitle: "File Berhasil Terkirim!",
                                    onPress: (isConfirm) {
                                  Navigator.pop(context);
                                  return isConfirm;
                                }, style: SweetAlertStyle.success);

                                // Navigator.pop(context);
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
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
