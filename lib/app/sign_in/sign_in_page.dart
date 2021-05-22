import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terralife/app/sign_in/sign_in_button.dart';
import 'package:terralife/app/sign_in/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, this.onSignIn}) : super(key: key);
  final void Function(User) onSignIn;
  // create function to check if we have connected with firebase


  Future<void> _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredentials.user);

      // sign in without username or password
      //singleton pattern to permit one instance of class global access to resources
    } catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      backgroundColor: Colors.lightGreen[50],
    );
  }
// log in widgets
  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Terralife',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 52.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 28.0,
          ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {
              print('Button Pressed');
            },
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            margin: 75,
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Colors.blue[900],
            onPressed: () {
              print('Button Pressed');
            },
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal,
            onPressed: () {
              print('Button Pressed');
            },
          ),
          SizedBox(height: 8.0),
          Text('or',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black87,
            color: Colors.lime[300],
            onPressed: _signInAnonymously
            // shorthand for callbacks that dont take arguments

            ,
          ),
        ],
      ),
    );
  }
}
