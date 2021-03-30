import 'package:ceria/views/generalPage.dart';
import 'package:flutter/material.dart';

class AddNilaiStudentRaport extends StatefulWidget {
  @override
  _AddNilaiStudentRaportState createState() => _AddNilaiStudentRaportState();
}

class _AddNilaiStudentRaportState extends State<AddNilaiStudentRaport> {
  String _valsubNilai;
  bool _visible = false;

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  List _subNilai = [
    "MB",
    "MSH",
    "BB",
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: "Pengisian Nilai",
      subjudul: 'Theo Galang saputra',
      subjudul2: 'Diri Sendiri / Identitas',
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggle,
            child: Container(
              width: MediaQuery.of(context).size.width / 1,
              margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text("Diri Sendiri / Identitas",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff41348C),
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visible,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("Indikator",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff41348C),
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text("Nilai",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff41348C),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visible,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Expanded(
                            child: Text(
                                "Anak mampu mengucapkan kalimat Syahadat ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            hint: Center(
                              child: Text(
                                '',
                              ),
                            ),
                            value: _valsubNilai,
                            items: _subNilai.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valsubNilai = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(30),
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color(0xff41348C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
}
