import 'package:ceria/providers/parent_assignment_list_viewmodel.dart';
import 'package:ceria/tools/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:shimmer/shimmer.dart';
import 'widgets/SimpleAssignmentView.dart';

class ShowAssignmentParent extends StatefulWidget {
  final String nis;
  final int idKelas;

  const ShowAssignmentParent({Key key, this.nis, this.idKelas});

  @override
  _ShowAssignmentParentState createState() => _ShowAssignmentParentState(
        nis: this.nis,
        idKelas: this.idKelas,
      );
}

class _ShowAssignmentParentState extends State<ShowAssignmentParent>
    with TickerProviderStateMixin {
  List<SimpleAssignmentView> assignmentDone = [];
  TabController _tabBarController;
  List<SimpleAssignmentView> assignmetNotDoneYet = [];

  String nis;
  int idKelas;
  _ShowAssignmentParentState({this.nis, this.idKelas});

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      initSize(context);
    });
    return ViewModelBuilder<ParentAssignmentListViewModel>.reactive(
      viewModelBuilder: () => ParentAssignmentListViewModel(
        nis: this.nis,
        idKelas: this.idKelas,
      ),
      onModelReady: (model) async {
        await model?.initial();
        assignmetNotDoneYet = model?.getListAssignmentsView();
        assignmentDone = model?.getListAssignmetsDone();
      },
      builder: (_, model, __) => Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                buildSimpleHeader(
                  context,
                  model?.child?.data?.nama,
                  model?.kelas?.data?.kelas,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff41348C),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: TabBar(
                    controller: _tabBarController,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        text: "Belum Selesai",
                      ),
                      Tab(
                        text: "Selesai",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabBarController,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: assignments(
                          data: assignmetNotDoneYet,
                          aspek: "Belum SELESAI",
                          isBusy: model?.isBusy ?? false,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: assignments(
                            data: assignmentDone,
                            aspek: "SELESAI",
                            isBusy: model?.isBusy ?? false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container assignments(
      {List<SimpleAssignmentView> data, String aspek, bool isBusy}) {
    return Container(
      child: isBusy
          ? listReplacement(vh: vh, vw: vw)
          : data.length != 0
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

  Column listReplacement({double vh, double vw}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listReplatementItem(vw, vh),
        listReplatementItem(vw, vh),
        listReplatementItem(vw, vh),
        listReplatementItem(vw, vh),
      ],
    );
  }

  Container listReplatementItem(double vw, double vh) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12 * vw, vertical: 2 * vh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2 * vw),
              child: ReplacementText(
                fontSize: 6 * vw,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2 * vw),
              child: ReplacementText(
                fontSize: 8 * vw,
              ),
            ),
          ],
        ));
  }

  Container buildSimpleHeader(BuildContext context, String nama, String kelas) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF41348C),
      ),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
      width: size.width,
      height: size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: nama == null
                ? ReplacementText(
                    fontSize: 24.0,
                  )
                : Text(
                    nama,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: nama == null
                ? ReplacementText(
                    fontSize: 24,
                  )
                : Text(
                    DateFormat("EEEE, d MMMM yyyy", "id_ID")
                        .format(DateTime.now()),
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: kelas == null
                ? ReplacementText(
                    fontSize: 13.0,
                  )
                : Text(
                    kelas,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Color(0xFF41348C),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
      title: Text("Tugas"),
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
