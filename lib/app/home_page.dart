import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onSignOut;
  const HomePage({Key key, @required this.onSignOut}) : super(key: key);
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();

      // sign out with firebase
      //singleton pattern to permit one instance of class global access to resources
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        TextButton(
          onPressed: _signOut,
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ]),
      body:  Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("Temperature",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            ),
            Card(child: Padding(
              padding: const EdgeInsets.all(30),
              child: Text("Humidity " ,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
            ),

            ),








          ],


        ),
      ),
      


    );
  }
}
