import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sweetalert/sweetalert.dart';

class AddAssignmentTugas extends StatefulWidget {
  final int id;

  const AddAssignmentTugas({this.id});
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

  @override
  Widget build(BuildContext context) {
    String dateText =
        DateFormat("EEEE, d MMMM yyyy", "id_ID").format(selectedDate);
    String hour = DateFormat("HH").format(selectedDate);
    String minute = DateFormat("mm").format(selectedDate);
    String time = "$hour:$minute WIB, ";

    return Scaffold(
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
                  assignmentLampiran(context),
                  buttonSave(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row alterdatepicker(String dateText) {
    return Row(
      children: [
        RaisedButton(
          onPressed: () {
            // _selectDate(context);
          },
          child: Text("DatePicker"),
        ),
        Text("$dateText"),
      ],
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

  Container assignmentLampiran(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: MediaQuery.of(context).size.width / 1.2,
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "  Lampiran",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff41348C),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Color(0xff41348C),
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Color(0xff41348C),
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Color(0xff41348C),
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Color(0xff41348C),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buttonSave() {
    return Container(
      margin: EdgeInsets.all(30),
      child: RaisedButton(
        onPressed: () {
          if (title != null && desc != null && selectedDate != oldTime) {
            setState(() {});

            SweetAlert.show(context,
                title: "Berhasil",
                subtitle: "Tugas baru telah dibuat!",
                style: SweetAlertStyle.success);
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
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => ShowAssignment(
            //               kelas: constKelas[widget.id],
            //               id: widget.id,
            //             )));

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
