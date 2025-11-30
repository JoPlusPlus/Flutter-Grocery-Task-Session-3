import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_task/Pages/home_page.dart';
import 'package:grocery_task/Pages/signup_page.dart';

int loggedUserId = 0;

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              padding: const EdgeInsets.only(left: 25, top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  ****************************  Loging *************************** 
                  Text("Loging",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("Enter your email and password",
                    style: TextStyle(
                      color: Color(0xff7C7C7C),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  //  ****************************  Email *************************** 
                  SizedBox(
                    width: 950.w,
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
                    width: 950.w,
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
                  //  ****************************  Forgot Password *************************** 
                  Padding(
                    padding: EdgeInsets.only(left: 600.w, top: 10),
                    child: Text("Forgot Password"),
                  ),
                  //  ****************************  Log in *************************** 
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 40),
                    child: GestureDetector(
                      onTap: () {
                        bool login = false;
                        for (int i = 0; i<userData.length; i++){
                          if (userData[i]["email"] == emailController.text){
                            if (userData[i]["password"] == passwordController.text){
                              login = true;
                              loggedUserId = i;
                            }
                          }
                        }
                        if (login == true){
                          
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        }
                        else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.red,
                                title: Text("Login Failed", style: TextStyle(color: Colors.white),),
                                content: Text("Incorrect email or password", style: TextStyle(color: Colors.white, fontSize: 18),),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("OK", style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                        width: 900.w,
                        height: 67,
                        decoration: BoxDecoration(
                          color: Color(0xff53b175),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Text("Log In",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          
                        ),),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 20, left: 150.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Don't have an account? ", style: TextStyle(fontWeight: FontWeight.w600),),
                        GestureDetector(
                          child: Text("Signup",
                            style: TextStyle(color: Color(0xff53b175), fontWeight: FontWeight.w600),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
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