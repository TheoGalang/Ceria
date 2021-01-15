import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final CrossAxisAlignment crossAxisAlignment;
  ChatMessage({this.text, this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff41348C),
                        fontWeight: FontWeight.normal),
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
