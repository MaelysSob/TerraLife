import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0, right: 20.0),
            child: Column(
              children: [
                Card(

                  color: Colors.green.shade50,
                  child: Container(
                    width: 350,
                    height: 500,
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:25.0 , bottom: 35, left: 20, right: 20),
                          child: Text("Terrarium Settings",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.lightGreen.shade300,
                                fontWeight: FontWeight.w800

                            ),),
                        ),

                        SizedBox(height:80,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("min Temperature"),
                            SizedBox(width: 50),
                            Text("max Temperature")
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("min Humidity"),
                            SizedBox(width:50),
                            Text("max Humidity")
                          ],
                        ),
                        SizedBox(height:80),
                        ElevatedButton(

                          style: ElevatedButton.styleFrom(
                              primary: Colors.lightGreen.shade100
                          ),
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Text("Turn all lights off",
                              style: TextStyle(color: Colors.lightGreen.shade300)
                          ),
                        ),




                      ],
                    ),
                  ),


                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
