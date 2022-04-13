import 'package:firebase_authintication/UI/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white54,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (_) => HomeScreen()));
          },
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          color: Colors.green,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: Image.asset("assets/images/image.png").image,
              radius: 100,
            ),
            Text(
              "Masum Rahman",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
