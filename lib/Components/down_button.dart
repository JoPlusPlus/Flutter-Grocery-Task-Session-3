import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class downButton extends StatelessWidget {
  String Message;
  void Function()? onTap;
  downButton({super.key, required this.Message,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 940.w,
        height: 200.h,
        decoration: BoxDecoration(
          color: Color(0xff53b175),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(Message,
          style: TextStyle(fontSize: 18, color: Colors.white),
          
          ),
        ),
      ),
    );
  }
}