import 'package:flutter/material.dart';

// ignore: must_be_immutable
class accountTile extends StatelessWidget {
  IconData? myicon;
  String conName;
  double leftPadArrow;
  accountTile({super.key, required this.myicon, required this.conName, required this.leftPadArrow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Icon(myicon),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(conName, style: TextStyle(fontSize: 18, color: Color(0xff181725)),),
          ),
          Padding(
            padding:  EdgeInsets.only(left: leftPadArrow),
            child: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
        
      ),
    );
  }
}