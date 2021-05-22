import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSignOut;

  const HomePage({Key key, @required this.onSignOut}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      widget.onSignOut();

      // sign out with firebase
      //singleton pattern to permit one instance of class global access to resources
    } catch (e) {
      print(e.toString());
    }
  }

  bool value = false;
  onUpdate(){
    setState(() {
      value=!value;// toggle between true and false
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        TextButton(
          onPressed: signOut,
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ]),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left:20,top:10,right: 20,bottom: 10),
                    child: Text(

                      "Temperature \n 20",// placeholder for data from sensor
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left:35,top:10,right: 35,bottom: 10),
                    child: Text(
                      "Humidity\n60",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.lightGreen.shade50,

                  child: ButtonBar(


                    alignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 350),


                        child: ElevatedButton(onPressed: (){
                          onUpdate();
                          onWrite();// write data to firebase to turn on lamp
                        }, child: value? Text(' Turn UV-Light ON'):Text('Turn UV-Light OFF'),
                          style: ElevatedButton.styleFrom(
                            primary: value? Colors.lightGreen.shade300:Colors.lightGreen.shade100
                          ),


                        ),

                      ),


                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),);
   }
   Future<void> onWrite() async {}
}


