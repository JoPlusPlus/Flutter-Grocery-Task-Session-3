import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Components/account_tile.dart';
import 'package:grocery_task/Components/down_button.dart';
import 'package:grocery_task/Pages/login_page.dart';
import 'package:grocery_task/Pages/signup_page.dart';

// ignore: must_be_immutable
class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  double divideHeight = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Image.asset("assets/images/pp.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 35),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 86),
                      child: Text(userData[loggedUserId]["username"]??'', style: TextStyle(fontSize: 20, color: Color(0xff181725)),),
                    ),
                    Text(userData[loggedUserId]["email"]??'', style: TextStyle(fontSize: 18, color: Color(0xff7c7c7c)),)
                    // 
                
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.shopping_bag_outlined, conName: "Orders", leftPadArrow: 620.w,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.person_pin_outlined, conName: "My Details", leftPadArrow: 530.w,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.location_on_outlined, conName: "Delivery Address", leftPadArrow: 390.w,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.credit_card, conName: "Payment Methods", leftPadArrow: 350.w,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.local_offer_outlined, conName: "Promo Card", leftPadArrow: 480.w,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.notifications_none, conName: "Notifications", leftPadArrow: 450.w,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.question_mark_rounded, conName: "Help", leftPadArrow: 620.w,),
          Divider(height: divideHeight,),
          accountTile(myicon: Icons.info_outline, conName: "About", leftPadArrow: 590.w,),
          Divider(height: divideHeight,),

          SizedBox(height: 300.h,),
          downButton(Message: "Log Out", onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),)),)
        ],
      ),
    );
  }
}