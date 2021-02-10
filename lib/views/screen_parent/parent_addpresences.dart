import 'package:ceria/models/child.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ceria/main.dart';
import 'package:sweetalert/sweetalert.dart';

class IsiKehadiranParent extends StatefulWidget {
  final Child child;

  const IsiKehadiranParent({Key key, this.child}) : super(key: key);

  @override
  _IsiKehadiranParentState createState() => _IsiKehadiranParentState();
}

class _IsiKehadiranParentState extends State<IsiKehadiranParent> {
  String status = 'hadir';

  TextEditingController controllerNomorInduk = TextEditingController();
  TextEditingController controllerTanggal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // initiate controller value
    controllerNomorInduk.text = widget.child.data.nomorInduk;
    controllerTanggal.text = DateTime.now().toString();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                decoration: BoxDecoration(
                    color: Color(0xff41348C),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Isi Kehadiran",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kelas 11 IPA 1",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 40, 0, 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Masukkan Nomor Induk",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TextField(
                      controller: controllerNomorInduk,
                      decoration: InputDecoration(
                          hintText: "ketik disini",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 0, 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Masukkan Tanggal",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TextField(
                      controller: controllerTanggal,
                      decoration: InputDecoration(
                          hintText: "ketik disini",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Radio(
                              value: 'hadir',
                              groupValue: status,
                              activeColor: Color(0xff41348C),
                              onChanged: (val) {
                                setState(() {
                                  status = val;
                                });
                              }),
                          Text("Hadir",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: <Widget>[
                          Radio(
                              value: 'izin',
                              groupValue: status,
                              activeColor: Color(0xff41348C),
                              onChanged: (val) {
                                setState(() {
                                  status = val;
                                });
                              }),
                          Text("Izin",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: <Widget>[
                          Radio(
                              value: 'sakit',
                              groupValue: status,
                              activeColor: Color(0xff41348C),
                              onChanged: (val) {
                                setState(() {
                                  status = val;
                                });
                              }),
                          Text("Sakit",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(30),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        onPressed: () {
                          // Navigator.pop(context);
                          this
                              .saveKehadiran(
                                  statusKehadiran: status,
                                  tanggal: controllerTanggal.text)
                              .then((value) {
                            if (value == 200) {
                              print("Success");
                              SweetAlert.show(context,
                                  title: "Berhasil",
                                  subtitle: "Kehadiran Tersimpan!",
                                  onPress: (isConfirm) {
                                Navigator.pop(context);

                                return isConfirm;
                              }, style: SweetAlertStyle.success);
                            } else {
                              print("Failed");
                              SweetAlert.show(context,
                                  title: "Gagal",
                                  subtitle: "Gagal tersimpan!",
                                  style: SweetAlertStyle.error);
                            }
                          });
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
              ),
            ),
          ),
        ],
      )),
    );
  }

  Future<int> saveKehadiran({String tanggal, String statusKehadiran}) async {
    String urlKehadiran = "https://ceriakan.id/api/attendance/store";

    // persiapkan data;

    checkConnectivity(
        context: context,
        child: IsiKehadiranParent(
          child: widget.child,
        ));

    try {
      FormData formData = new FormData.fromMap({
        "id_class": widget.child.data.idKelas,
        "nomor_induk": widget.child.data.nomorInduk,
        "tanggal": tanggal,
        "status_kehadiran": statusKehadiran,
      });

      Response response = await Dio().post(urlKehadiran, data: formData);
      return response.statusCode;
    } catch (e) {
      print("expectation Caugch: $e");
    }

    return 400;
  }
}
