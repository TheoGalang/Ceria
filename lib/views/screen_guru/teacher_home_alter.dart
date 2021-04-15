import 'package:ceria/main.dart';
import 'package:ceria/providers/teacher/teacher_home_viewmodel.dart';
import 'package:ceria/tools/constants.dart';
import 'package:ceria/views/screen_guru/raport/teacher_add_nilai.dart';
import 'package:ceria/views/screen_guru/raport/teacher_add_themes.dart';
import 'package:ceria/views/screen_guru/raport/teacher_choose_history.dart';
import 'package:ceria/views/screen_guru/raport/teacher_choose_theme.dart';
import 'package:ceria/views/screen_guru/raport/teacher_indicator.dart';
import 'package:ceria/views/screen_guru/raport/teacher_rapot_nilai.dart';
import 'package:ceria/views/screen_guru/raport/teacher_studentlist_rapot.dart';
import 'package:ceria/views/screen_guru/teacher_chooseclass.dart';
import 'package:ceria/views/screen_guru/teacher_presence_chooseclass.dart';
import 'package:ceria/views/screen_guru/teacher_presence_list.dart';
import 'package:ceria/views/screen_guru/raport/teacher_raport_choose.dart';
import 'package:ceria/views/screen_guru/teacher_studentlist.dart';
import 'package:ceria/views/screen_guru/tugas/teacher_assignment_chooseclass.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class TeacherHomeAlter extends StatefulWidget {
  final String nip;

  const TeacherHomeAlter({Key key, this.nip}) : super(key: key);
  @override
  _TeacherHomeAlterState createState() => _TeacherHomeAlterState();
}

class _TeacherHomeAlterState extends State<TeacherHomeAlter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      initSize(context);
    });

    // print(" Teacher home alter : ${widget.nip}");
    return ViewModelBuilder<TeacherHomeViewModel>.reactive(
      viewModelBuilder: () => TeacherHomeViewModel(nip: widget.nip),
      onModelReady: (model) {
        model.initial();
      },
      builder: (_, model, __) => Scaffold(
        appBar: buildAppBar(),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(content: Text("Tekan sekali lagi untuk keluar.")),
          child: SingleChildScrollView(
            child: Column(
              children: [
                userHeader(
                  parentName: model?.teacher?.data?.nama ?? "",
                  className: " ",
                ),
                buildGridMenu(model: model, teachersID: widget.nip),
                buildPengumuman(),
              ],
            ),
          ),
        ),
      ),
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

  Container buildGridMenu({TeacherHomeViewModel model, String teachersID}) {
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
            onTap: ChooseClassTeacherAbsen(),
          ),
          buildMenu(
            name: "Tugas",
            iconData: Icons.file_present,
            onTap: ChooseClassTeacherTugas(
              // listKelas: model?.listKelas ?? [],
              teachersID: teachersID,
            ),
          ),
          buildMenu(
            name: "Raport",
            iconData: Icons.school,
            onTap: TeacherChooseOptionRaport(),
          ),
          buildMenu(
            name: "Kelas",
            iconData: Icons.account_balance_outlined,
            onTap: ChooseClassTeacher(),
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
        onTap != null
            ? Navigator.push(context, MaterialPageRoute(builder: (_) => onTap))
            : SizedBox();
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
                  fontSize: 8 * vw,
                )
              : Text(
                  "Bapak/Ibu Guru " + parentName,
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
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {}),
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
