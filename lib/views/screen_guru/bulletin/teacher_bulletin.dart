import 'package:flutter/material.dart';

class TeacherBulletin extends StatefulWidget {
  @override
  _TeacherBulletinState createState() => _TeacherBulletinState();
}

class _TeacherBulletinState extends State<TeacherBulletin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: Text('Judul Bulletin',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff41348C),
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Image(
                        image: AssetImage('assets/images/sport.jpg'),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill)),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Expanded(
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu")),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          {
            Navigator.pop(context);
          }
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text("Judul Bulletin"),
      backgroundColor: Color(0xff41348C),
    );
  }
}
