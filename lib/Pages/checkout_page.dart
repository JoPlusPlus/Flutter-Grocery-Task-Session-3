import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Components/down_button.dart';
import 'package:grocery_task/Core/Models/cart_model.dart';
import 'package:grocery_task/Pages/home_page.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 300.w,right: 75.w,left: 50.w),
            child: Image.asset("assets/images/c.png",
              width: 600.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w,top: 80),
            child: Text("Your Order has been", style: TextStyle(fontSize: 28, color: Color(0xff181725)),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w,bottom: 30),
            child: Text("accepted", style: TextStyle(fontSize: 28, color: Color(0xff181725)),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w,),
            child: Text("Your items have been placed and is on", style: TextStyle(fontSize: 16, color: Color(0xff7c7c7c)),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w,),
            child: Text("it's way to being processed", style: TextStyle(fontSize: 16, color: Color(0xff7c7c7c)),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 70.w, top: 180.w),
            child: downButton(Message: "Track Order", onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
              final cart = Provider.of<CartModel>(context, listen: false);
              cart.clearCart();
            }
            )),
          Padding(
            padding: EdgeInsets.only(left: 70.w, top: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                final cart = Provider.of<CartModel>(context, listen: false);
                cart.clearCart();
              },
              child: Container(
                width: 353,
                height: 67,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Back to home",
                  style: TextStyle(fontSize: 18, color: Color(0xff181725)),
                  
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}