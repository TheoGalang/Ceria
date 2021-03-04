import 'package:ceria/models/students.dart';
import 'package:ceria/providers/parent/parent_home_viewmodel.dart';
import 'package:ceria/tools/constants.dart';
import 'package:ceria/views/screen_parent/parent_addpresences.dart';
import 'package:ceria/views/screen_parent/parent_studentlist.dart';
import 'package:ceria/views/screen_parent/tugas/parent_assignment_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui';
import 'package:ceria/main.dart';
import 'package:stacked/stacked.dart';
import 'package:sweetalert/sweetalert.dart';

class ParentHomeAlter extends StatefulWidget {
  final String nik;

  const ParentHomeAlter({Key key, this.nik}) : super(key: key);
  @override
  _ParentHomeAlterState createState() => _ParentHomeAlterState();
}

class _ParentHomeAlterState extends State<ParentHomeAlter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      initSize(context);
    });
    return ViewModelBuilder<ParentHomeViewModel>.reactive(
      viewModelBuilder: () => ParentHomeViewModel(nik: widget.nik),
      onModelReady: (model) {
        model.initial(context: context);
      },
      builder: (_, model, __) {
        return Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                userHeader(
                  parentName: model?.parent?.data?.nama ?? "",
                  className: model?.kelas?.data?.kelas ?? "",
                ),
                buildGridMenu(model: model),
                buildPengumuman(),
              ],
            ),
          ),
        );
      },
    );
  }

  Container buildPengumuman() {
    return Container(
      padding: EdgeInsets.all(5 * vw),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 3 * vw),
            child: Text("Pengumuman",
                style: TextStyle(
                    fontSize: 5 * vw,
                    color: Color(0xff41348C),
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(vw),
            ),
            padding: EdgeInsets.all(3 * vw),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Rapat Online Bersama Kepala Sekolah",
                      style: TextStyle(
                          fontSize: 3.5 * vw,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("13.00",
                      style: TextStyle(
                          fontSize: 3.5 * vw,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Via Google Meet",
                      style: TextStyle(
                          fontSize: 3.5 * vw,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildGridMenu({ParentHomeViewModel model}) {
    return Container(
      padding: EdgeInsets.all(3 * vw),
      height: 40 * vh,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: .8,
        ),
        children: [
          buildMenu(
            name: "Kehadiran",
            iconData: Icons.emoji_people_outlined,
            onTap: IsiKehadiranParent(
              model: model,
            ),
          ),
          buildMenu(
            name: "Tugas",
            iconData: Icons.file_present,
            onTap: ShowAssignmentParent(
              nis: model?.child?.data?.nomorInduk,
              idKelas: model?.kelas?.data?.id,
            ),
          ),
          buildMenu(
            name: "Raport",
            iconData: Icons.school,
            onTap: null,
          ),
          buildMenu(
            name: "Kelas",
            iconData: Icons.account_balance_outlined,
            onTap: ListStudentParent(
              className: model?.kelas?.data?.kelas ?? "",
              classId: model?.kelas?.data?.id,
              students: model?.students ?? Students(),
            ),
          ),
          buildMenu(
            name: "Buletin",
            iconData: Icons.campaign_outlined,
            onTap: null,
          ),
          buildMenu(
            name: "Dokumen",
            iconData: Icons.assignment_outlined,
            onTap: null,
          ),
          buildMenu(
            name: "Reminder",
            iconData: Icons.alarm,
            onTap: null,
          ),
        ],
      ),
    );
  }

  Widget buildMenu({String name, IconData iconData, Widget onTap}) {
    return GestureDetector(
      onTap: () {
        if (name == "Kehadiran") {
          String hari =
              DateFormat("EEEE", "id_ID").format(DateTime.now()).toString();

          print("Hari : $hari");
          if (hari == "Sabtu" || hari == "Minggu") {
            SweetAlert.show(context,
                title: "Hari Libur",
                subtitle: "Tidak ada jadwal isi kehadiran!",
                style: SweetAlertStyle.confirm);
          } else {
            onTap != null
                ? Navigator.push(
                    context, MaterialPageRoute(builder: (_) => onTap))
                : SizedBox();
          }
        } else {
          onTap != null
              ? Navigator.push(
                  context, MaterialPageRoute(builder: (_) => onTap))
              : SizedBox();
        }
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff41348C),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
            padding: EdgeInsets.all(20),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 8 * vw,
            ),
          ),
          Text(name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 3.5 * vw,
                  color: Color(0xff41348C),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Container userHeader({String parentName, String className}) {
    return Container(
      height: 20 * vh,
      width: orientation == Orientation.landscape ? 100 * vh : 100 * vw,
      padding: EdgeInsets.only(left: 10 * vw),
      decoration: BoxDecoration(
        color: Color(0xff41348C),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10 * vw),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          parentName == null || parentName == ""
              ? ReplacementText(
                  fontSize: 6 * vw,
                )
              : Text(
                  greetings(),
                  style: TextStyle(
                      fontSize: 6 * vw,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
          parentName == null || parentName == ""
              ? ReplacementText(
                  fontSize: 7 * vw,
                )
              : Text(
                  "Bapak/Ibu " + parentName,
                  // "Nama ${DateTime.now().add(Duration(hours: 7)).toIso8601String()}"
                  style: TextStyle(
                      fontSize: 6 * vw,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
          className == null || className == ""
              ? ReplacementText(
                  fontSize: 6 * vw,
                )
              : Text(
                  DateFormat("EEEE, d MMMM yyyy", "id_ID")
                      .format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 3.5 * vw,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
          className == null || className == ""
              ? ReplacementText(
                  fontSize: 5 * vw,
                )
              : Text(
                  className,
                  style: TextStyle(
                      fontSize: 3.5 * vw,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      // title: Text("Home Parent"),
      elevation: 0,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //   ),
      //   onPressed: () {},
      // ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.white,
              size: 20,
            ),
            TextButton(
              onPressed: () {
                logOut(context: context);
              },
              child: Text("Logout ",
                  style: TextStyle(
                      fontSize: 4 * vw,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}

class ReplacementText extends StatelessWidget {
  final double fontSize;
  ReplacementText({
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: fontSize / 10),
      child: Shimmer.fromColors(
          baseColor: Colors.deepPurple[400],
          highlightColor: Colors.grey[400],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:
                  BorderRadius.circular(MediaQuery.of(context).size.width / 50),
            ),
            width: MediaQuery.of(context).size.width * .4 * fontSize / 24,
            height: MediaQuery.of(context).size.width * .05,
          )),
    );
  }
}
