import '../../generalPage.dart';
import 'package:flutter/material.dart';

class ListNilaiStudentRaport extends StatefulWidget {
  @override
  _ListNilaiStudentRaportState createState() => _ListNilaiStudentRaportState();
}

class _ListNilaiStudentRaportState extends State<ListNilaiStudentRaport> {
  bool _visible = false;

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      judul: "Rapot Siswa",
      subJudul1: 'Theo Galang saputra',
      subJudul2: 'Senin, 1 Maret 2021',
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
                        Text("BB",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ],
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
