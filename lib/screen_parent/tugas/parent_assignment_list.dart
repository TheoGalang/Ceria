import 'package:ceria/screen_parent/parent_home.dart';
import 'package:ceria/screen_parent/tugas/widgets/SimpleAssignmentView.dart';
import 'package:ceria/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAssignmentParent extends StatefulWidget {
  @override
  _ShowAssignmentParentState createState() => _ShowAssignmentParentState();
}

class _ShowAssignmentParentState extends State<ShowAssignmentParent> {
  final List<SimpleAssignmentView> assignmentDone = [];
  final List<SimpleAssignmentView> assingmentNotDoneYet = [];

  void loadAssignment() {
    List<SimpleAssignmentView> done = [];
    List<SimpleAssignmentView> notyet = [];

    for (var item in constAssingments) {
      item.isComplete
          ? done.insert(
              0,
              SimpleAssignmentView(
                assignment: item,
              ))
          : notyet.insert(
              0,
              SimpleAssignmentView(
                assignment: item,
              ));
    }

    setState(() {
      assignmentDone.addAll(done);
      assingmentNotDoneYet.addAll(notyet);
    });
  }

  @override
  void initState() {
    super.initState();
    loadAssignment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            buildSimpleHeader(context),
            assignmentLabel(label: "SELESAI"),
            assignments(data: assignmentDone, aspek: "SELESAI"),
            assignmentLabel(label: "BELUM SELESAI"),
            assignments(data: assingmentNotDoneYet, aspek: "BELUM SELESAI"),
          ],
        ),
      ),
    );
  }

  Flexible assignments({List<SimpleAssignmentView> data, String aspek}) {
    return Flexible(
      child: data.length != 0
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 50),
              itemBuilder: (_, index) => data[index],
              itemCount: data.length)
          : Container(
              child: Center(
                child: Text("Belum ada tugas yang $aspek"),
              ),
            ),
    );
  }

  Widget assignmentLabel({String label}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "TUGAS $label",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff41348C),
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            decoration: BoxDecoration(
              color: Color(0xff41348c),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                " ${label == "SELESAI" ? assignmentDone.length : assingmentNotDoneYet.length} ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildSimpleHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF41348c),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "Theo Galang Saputra",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Kamis, 17 September 2020",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Nama Kelas",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF41348C),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeParent(),
              ));
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
