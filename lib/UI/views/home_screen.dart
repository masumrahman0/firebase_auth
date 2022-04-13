import 'package:firebase_authintication/UI/controller/google_login_controller.dart';
import 'package:firebase_authintication/UI/views/login_screen.dart';
import 'package:firebase_authintication/UI/views/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WELCOME HERE!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "I already have an account",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=>LoginScreen()));
                  },
                  child: Text("LOGIN"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    textStyle: TextStyle(fontSize: 20)
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "New Here?",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=>SignUpScreen()));
                  },
                  child: Text("SIGN UP"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    textStyle: TextStyle(fontSize: 20)
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                Column(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        GoogleLoginController().signInWithGoogle(context);
                      },
                      icon: Image.asset(
                        "assets/images/google.png",
                        height: 32,
                        width: 32,
                      ),
                      label: Text("Sign in with google"),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // FloatingActionButton.extended(
                    //   onPressed: () {},
                    //   icon: Image.asset(
                    //     "assets/images/github.png",
                    //     height: 32,
                    //     width: 32,
                    //   ),
                    //   label: Text("Sign in with GitHub"),
                    //   backgroundColor: Colors.white,
                    //   foregroundColor: Colors.black,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
