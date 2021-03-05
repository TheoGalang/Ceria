import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ceria/models/submissionCollected.dart';
import 'package:intl/intl.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:url_launcher/url_launcher.dart';

class IsiNilaiTeacher extends StatefulWidget {
  final String nip;
  final Data data;
  final String assigmentsTitle;

  const IsiNilaiTeacher({Key key, this.data, this.assigmentsTitle, this.nip})
      : super(key: key);
  @override
  _IsiNilaiTeacherState createState() => _IsiNilaiTeacherState();
}

class _IsiNilaiTeacherState extends State<IsiNilaiTeacher> {
  String valueChoose;
  String feedback;
  String location = "";
  TextEditingController feedbackController = TextEditingController();
  List<String> values = ["MB", "MSH", "BB"];

  @override
  Widget build(BuildContext context) {
    this.location = widget?.data?.file?.length == 0
        ? ""
        : widget?.data?.file?.first?.location;
    return Scaffold(
      appBar: AppBar(
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
        title: Text("Nilai Tugas"),
        backgroundColor: Color(0xff41348C),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.assigmentsTitle,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
                          widget.data.nama,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff41348C),
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
                        Flexible(
                          child: Text(
                            "Dikumpulkan pada hari " +
                                DateFormat(
                                        "EEEE, d MMMM yyyy, 'pukul' hh:mm 'WIB'",
                                        "id_ID")
                                    .format(DateTime.parse(
                                        widget?.data?.dateCreated ??
                                            DateTime.now())),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(3, 10, 3, 10),
                          child: Icon(
                            Icons.download_sharp,
                            color: Color(0xff41348C),
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            String url = "https://ceriakan.id/storage/app/" +
                                this.location;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              SweetAlert.show(context,
                                  title: "Gagal",
                                  subtitle: "File tidak dapat dibuka",
                                  style: SweetAlertStyle.error);

                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            "Klik disini untuk download file tugas",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff41348C),
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //coba 2 dropdown button
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            " Nilai : ",
                            style: TextStyle(fontSize: 18),
                          ),
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xff41348C),
                                width: MediaQuery.of(context).size.width / 200,
                              ),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.only(left: 10),
                            child: DropdownButton(
                              dropdownColor: Colors.indigo[100],
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down_rounded),
                              hint: Text("Pilih Nilai"),
                              items: values.map((valueItem) {
                                return DropdownMenuItem(
                                  child: Text(valueItem),
                                  value: valueItem,
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoose = newValue;
                                });
                              },
                              value: valueChoose,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // akhir coba2 dropdown

                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ]),
                    child: TextField(
                      controller: feedbackController,
                      onChanged: (value) {
                        setState(() {
                          this.feedback = value;
                        });

                        print(feedback);
                      },
                      decoration: InputDecoration(
                          hintText: "Feedback",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      onPressed: () async {
                        try {
                          FormData formData = FormData.fromMap({
                            "id": widget?.data?.id ?? "",
                            "nis": widget?.data?.nis ?? "",
                            "nip": widget?.nip ?? "",
                            "grade": this.valueChoose ?? "BSH",
                            "description": this.feedbackController.text ?? "",
                          });

                          Response response = await Dio().post(
                              "https://ceriakan.id/api/submission/grade",
                              data: formData);

                          if (response.statusCode == 200) {
                            SweetAlert.show(context,
                                title: "Berhasil",
                                subtitle: "Nilai Berhasil di Simpan.",
                                style: SweetAlertStyle.success,
                                onPress: (confirm) {
                              Navigator.pop(context);
                              return confirm;
                            });
                          } else {
                            SweetAlert.show(
                              context,
                              title: "Gagal",
                              subtitle: "Terjadi kendala, silahkan coba lagi!",
                              style: SweetAlertStyle.error,
                            );
                          }
                        } catch (e) {
                          print("Terjadi error $e");
                        }

                        // SweetAlert.show(context,
                        //     title: "Berhasil",
                        //     subtitle: "Nilai Berhasil di Simpan.",
                        //     style: SweetAlertStyle.success, onPress: (confirm) {
                        //   Navigator.pop(context);
                        //   return confirm;
                        // });
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
