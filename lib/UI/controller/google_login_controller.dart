import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authintication/UI/views/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleLoginController {
  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? _user = _userCredential.user;

    if (_user!.uid.isNotEmpty) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (_) => UserScreen(_user)));
    } else {
      print("Something is wrong");
    }
  }
}
