import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Models/cart_model.dart';
// ignore: unused_import
import 'package:grocery_task/Pages/Onboarding_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(1080, 2400),  
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
