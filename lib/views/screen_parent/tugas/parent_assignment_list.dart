import 'package:ceria/providers/parent_assignment_list_viewmodel.dart';
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
  Size size = Size.zero;
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
    size = MediaQuery.of(context).size;

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
          ? Center(
              child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ))
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
                    text: "Nama Siswa",
                    fontSize: 24,
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
            child: Text(
              DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now()),
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
                    text: "Kelas",
                    fontSize: 13,
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
  final String text;
  final int fontSize;
  const ReplacementText({
    Key key,
    this.text,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
          baseColor: Colors.deepPurple[400],
          highlightColor: Colors.grey[400],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
            width: MediaQuery.of(context).size.width * .4 * fontSize / 24,
            height: 20,
          )),
    );
  }
}
