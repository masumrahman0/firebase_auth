import 'dart:async';
import 'package:firebase_authintication/UI/views/home_screen.dart';
import 'package:firebase_authintication/UI/views/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  final box = GetStorage();
  
  chooseScreen(context) async{
    var UserId = await box.read('id');
    if(UserId!=null){
      Navigator.push(context, CupertinoPageRoute(builder: (_)=>ProfileScreen()));
    }else {
       Navigator.push(context, CupertinoPageRoute(builder: (_)=>HomeScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () =>chooseScreen(context));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: Image.asset("assets/images/image.png").image,
              radius: 100,
            ),
          ],
        ),
      ),
    );
  }
}
