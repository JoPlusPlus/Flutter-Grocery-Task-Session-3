import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Components/down_button.dart';
import 'package:grocery_task/Pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/onbording.png",
            width: 1.sw,
            height: 1.sh,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2000.h, left: 70.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: downButton(Message: "Get Started",),
            ),
          )
        ],
      ),
    );
  }
}