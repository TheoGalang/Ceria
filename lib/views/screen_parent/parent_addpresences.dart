import '../../providers/parent/parent_home_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:intl/intl.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:supercharged/supercharged.dart';

enum StatusKehadiran { hadir, izin, sakit }

class IsiKehadiranParent extends StatefulWidget {
  final ParentHomeViewModel model;

  const IsiKehadiranParent({Key key, this.model}) : super(key: key);

  @override
  _IsiKehadiranParentState createState() => _IsiKehadiranParentState();
}

class _IsiKehadiranParentState extends State<IsiKehadiranParent> {
  String status = 'hadir';
  StatusKehadiran statusKehadiran = StatusKehadiran.hadir;

  TextEditingController controllerNomorInduk = TextEditingController();
  TextEditingController controllerTanggal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // initiate controller value
    controllerNomorInduk.text = widget.model.child.data.nomorInduk;
    controllerTanggal.text = DateTime.now().toString();

    status = statusKehadiran == StatusKehadiran.hadir
        ? "hadir"
        : statusKehadiran == StatusKehadiran.izin
            ? "izin"
            : statusKehadiran == StatusKehadiran.sakit
                ? "sakit"
                : "tidak hadir | alpha";

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          buildAppbar(context),
          buildAlterInputField(context),
        ],
      )),
    );
  }

  Widget buildAlterInputField(BuildContext context) {
    return Flexible(
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
                  child: Text("Pilih Status Kehadiran",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // button hadir
                    RaisedButton(
                      onPressed: () {
                        if (statusKehadiran == StatusKehadiran.hadir) {
                          setState(() {
                            statusKehadiran = null;
                          });
                        } else {
                          setState(() {
                            statusKehadiran = StatusKehadiran.hadir;
                          });
                        }
                      },
                      child: Text(
                        "Hadir",
                        style: TextStyle(
                          color: statusKehadiran == StatusKehadiran.hadir
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      color: statusKehadiran == StatusKehadiran.hadir
                          ? "41348C".toColor()
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    // button izin
                    RaisedButton(
                      onPressed: () {
                        if (statusKehadiran == StatusKehadiran.izin) {
                          setState(() {
                            statusKehadiran = null;
                          });
                        } else {
                          setState(() {
                            statusKehadiran = StatusKehadiran.izin;
                          });
                        }
                      },
                      child: Text(
                        "Izin",
                        style: TextStyle(
                          color: statusKehadiran == StatusKehadiran.izin
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      color: statusKehadiran == StatusKehadiran.izin
                          ? "41348C".toColor()
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    // button sakit
                    RaisedButton(
                      onPressed: () {
                        if (statusKehadiran == StatusKehadiran.sakit) {
                          setState(() {
                            statusKehadiran = null;
                          });
                        } else {
                          setState(() {
                            statusKehadiran = StatusKehadiran.sakit;
                          });
                        }
                      },
                      child: Text(
                        "Sakit",
                        style: TextStyle(
                          color: statusKehadiran == StatusKehadiran.sakit
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      color: statusKehadiran == StatusKehadiran.sakit
                          ? "41348C".toColor()
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () {
                    bool isLoading = true;
                    // Navigator.pop(context);
                    isLoading
                        ? SweetAlert.show(context,
                            title: "Menyimpan Kehadiran...",
                            style: SweetAlertStyle.loading)
                        : SizedBox();

                    this
                        .saveKehadiran(context,
                            statusKehadiran: status,
                            tanggal: controllerTanggal.text)
                        .then((value) {
                      if (value == 200) {
                        setState(() {
                          isLoading = false;
                        });

                        print("Success");
                        SweetAlert.show(context,
                            title: "Berhasil", subtitle: "Kehadiran Tersimpan!",
                            onPress: (isConfirm) {
                          Navigator.pop(context);

                          return isConfirm;
                        }, style: SweetAlertStyle.success);
                      } else {
                        setState(() {
                          isLoading = false;
                        });

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
    );
  }

  Flexible buildInputField(BuildContext context) {
    return Flexible(
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
                        .saveKehadiran(context,
                            statusKehadiran: status,
                            tanggal: controllerTanggal.text)
                        .then((value) {
                      if (value == 200) {
                        print("Success");
                        SweetAlert.show(context,
                            title: "Berhasil", subtitle: "Kehadiran Tersimpan!",
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
    );
  }

  Flexible buildAppbar(BuildContext context) {
    return Flexible(
      flex: 1,
      child: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height / 3,
          padding: EdgeInsets.fromLTRB(20, 15, 0, 20),
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
                margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
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
                  widget.model.child.data.nama,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.model.kelas.data.kelas,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormat("EEEE, d MMMM yyyy", "id_ID")
                      .format(DateTime.now()),
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
    );
  }

  Future<int> saveKehadiran(BuildContext context,
      {String tanggal, String statusKehadiran}) async {
    String urlKehadiran = "https://ceriakan.id/api/attendance/store";

    // persiapkan data;
    print(statusKehadiran);

    checkConnectivity(
        context: context,
        child: IsiKehadiranParent(
          model: widget.model,
        ));

    try {
      FormData formData = new FormData.fromMap({
        "id_class": widget.model.child.data.idKelas,
        "nomor_induk": widget.model.child.data.nomorInduk,
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
