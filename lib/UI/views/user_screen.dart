import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authintication/UI/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  User user;
  UserScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: Image.network(user.photoURL.toString()).image,
              radius: 100,
            ),
            Text(
              user.displayName.toString(),
              style: Get.textTheme.bodyText2,
            ),
            Text(
              user.email.toString(),
              style: Get.textTheme.bodyText1,
            ),
            SizedBox(height: 20,),
            ActionChip(
              avatar: Icon(Icons.logout),
              label: Text("Logout"),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_)=>HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
