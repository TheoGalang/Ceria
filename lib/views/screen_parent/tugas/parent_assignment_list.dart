import 'package:ceria/providers/parent_assignment_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import 'widgets/SimpleAssignmentView.dart';

class ShowAssignmentParent extends StatefulWidget {
  final String nis;
  final int idKelas;

  const ShowAssignmentParent({Key key, this.nis, this.idKelas})
      : super(key: key);

  @override
  _ShowAssignmentParentState createState() => _ShowAssignmentParentState();
}

class _ShowAssignmentParentState extends State<ShowAssignmentParent>
    with TickerProviderStateMixin {
  List<SimpleAssignmentView> assignmentDone = [];
  TabController _tabBarController;
  List<SimpleAssignmentView> assignmetNotDoneYet = [];

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
    return ViewModelBuilder<ParentAssignmentListViewModel>.reactive(
      viewModelBuilder: () => ParentAssignmentListViewModel(
        nis: widget.nis,
        idKelas: widget.idKelas,
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
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50))),
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
                      )
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

  Flexible assignments({
    List<SimpleAssignmentView> data,
    String aspek,
    bool isBusy,
  }) {
    return Flexible(
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
        // border: Border.symmetric(
        //     vertical: BorderSide(
        //   color: Color(0xFF41348C),
        //   width: 10,
        // )),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                nama ?? "Theo Galang Saputra",
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
              child: Text(
                kelas ?? "Nama Kelas",
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
    );
  }
}
