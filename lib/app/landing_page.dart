import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terralife/app/home_page.dart';
import 'package:terralife/app/sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
// stful to store state for deciding on homepage or login

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;
  void _updateUser(User user){
    setState(() {
      _user = user;
    });
    print("User id: ${user.uid}");
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn:_updateUser,
        // doesnt return values so it works in shorthand
      );
    }
    return HomePage(
      onSignOut: () => _updateUser(null),
    );
  }
}
