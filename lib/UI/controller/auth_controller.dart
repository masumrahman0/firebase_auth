import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authintication/UI/views/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class AuthController {
  final box = GetStorage();
  Future signUp(email, password, context) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    try {
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        box.write('id', authCredential.uid);
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => ProfileScreen()));
      } else {
        print("Sign Up Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e){
      print(e);
    }
  }


  Future signIn(email, password, context) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    try {
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => ProfileScreen()));
      } else {
        print("Sign Up Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e){
      print(e);
    }
  }
}
