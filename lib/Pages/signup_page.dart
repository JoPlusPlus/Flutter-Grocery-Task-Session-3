import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Pages/login_page.dart';

List<Map<String, String>> userData = [];


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // variables

  bool _obscure = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  // 

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 500.w, top: 77.25),
              child: Image.asset("assets/images/Carrot.png"),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 25, top: 100.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("Enter your credentials to continue",
                    style: TextStyle(
                      color: Color(0xff7C7C7C),
                    ),
                  ),
                   SizedBox(height: 80.w,),
                  //  ****************************  Username *************************** 
                  SizedBox(
                    width: 364.12,
                    height: 78.55,
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        label: Text("Username",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),  
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //  ****************************  Email *************************** 
                  SizedBox(
                    width: 364.12,
                    height: 78.55,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text("Email",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),  
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //  ****************************  Password *************************** 
                  SizedBox(
                    width: 364.12,
                    height: 78.55,
                    child: TextField(
                      controller: passwordController,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        label: Text("Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_obscure? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                        )
                      ),
                    ),
                  ),
                  //  ****************************  By Continuing *************************** 
                  Row(
                    children: [
                      Text("By continuing you agree to our ",),
                      Text("Terms of Services", style: TextStyle(color: Color(0xff53b175)),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("and "),
                      Text("Privacy Policy", style: TextStyle(color: Color(0xff53b175)),)
                    ],
                  ),
                  //  ****************************  Sign Up *************************** 
                  Padding(
                    padding: EdgeInsets.only(left: 8, top: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: GestureDetector(
                        onTap: () {
                          userData.add({"email": emailController.text,"password": passwordController.text,
                            "username":usernameController.text});
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Container(
                          width: 900.w,
                          height: 67,
                          decoration: BoxDecoration(
                            color: Color(0xff53b175),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text("Sign Up",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            
                          ),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20, left: 150.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Already have an account? ", style: TextStyle(fontWeight: FontWeight.w600),),
                        GestureDetector(
                          child: Text("LogIn",
                            style: TextStyle(color: Color(0xff53b175), fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                        ),
                      ],
                    ),
                  )
        
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}