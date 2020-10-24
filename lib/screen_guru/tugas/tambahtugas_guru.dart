import 'package:ceria/screen_guru/tugas/listtugas_guru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController controller = TextEditingController();

class AddAssignmentTugas extends StatefulWidget {
  @override
  _AddAssignmentTugasState createState() => _AddAssignmentTugasState();
}

class _AddAssignmentTugasState extends State<AddAssignmentTugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return ShowAssignment();
              }));
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Tambah Tugas"),
        backgroundColor: Color(0xff41348C),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Judul Tugas",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controller,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "Deskripsi Tugas",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Waktu Pengumpulan",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Lampiran",
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
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
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
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
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
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
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
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
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
                        Container(
                          margin: EdgeInsets.all(30),
                          child: RaisedButton(
                            onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
