import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_database/firebase_database.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  bool value = false;
  bool value2= false;
  bool value3= false;
  bool value4= false;

  final dbRef = FirebaseDatabase.instance.reference();
  onToggle(bool toggle){
    setState(() {
      toggle=!toggle;
      // toggle between true and false
    });
  }
  onUpdate() {
    setState(() {
      value =  !value;
      value4=  !value4;// toggle between true and false
    });
  }
  onUpdate2() {
    setState(() {
      value2 =  !value2;
      // toggle between true and false
    });
  }
  onUpdate3() {
    setState(() {
      value3 =  !value3;
      // toggle between true and false
    });
  }
  onUpdate4() {
    setState(() {
      value4 =  !value4;
      // toggle between true and false
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(

        body: StreamBuilder(// to listen to data async
          stream: dbRef.child("Data").onValue,// fires when data is updated
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError &&
                snapshot.data.snapshot.value != null) {
              final temp = snapshot.data.snapshot.value["Temperature"].toString();
              final humidity = snapshot.data.snapshot.value["Humidity"].toString();
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:50),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20, bottom: 10),
                                child: Text(
                                  "Temperature \n $temp",
                                  // placeholder for data from sensor
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 35, top: 10, right: 35, bottom: 10),
                                child: Text(
                                  "Humidity\n  $humidity%",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 35.0),
                      height: 430,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:<Widget> [
                          Container(
                            width:350,
                            child: Card(


                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green.shade50,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: value
                                          ? AssetImage("images/hanging_lamp.png",
                                      )
                                          : AssetImage("images/UVAhanging_lamp.png"),

                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.topCenter
                                  ),
                                ),
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 350.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          onUpdate();
                                          writeData("UVLightstate", value); // write data to firebase to turn on lamp
                                        },
                                        child: value
                                            ? Text(' UV-Light ON')
                                            : Text(' UV-Light OFF'),
                                        style: ElevatedButton.styleFrom(
                                            primary: value
                                                ? Colors.lightGreen.shade100
                                                : Colors.lightGreen.shade300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Container(
                            width:350,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green.shade50,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:  value2
                                          ? AssetImage("images/hanging_lamp.png",
                                      )
                                          : AssetImage("images/UVBhanging_lamp.png"),

                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.topCenter
                                  ),
                                ),
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 350.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          onUpdate2();
                                          writeData("UVBLightstate", value2); // write data to firebase to turn on lamp
                                        },
                                        child: value2
                                            ? Text('  UVB-Light ON')
                                            : Text(' UVB-Light OFF'),
                                        style: ElevatedButton.styleFrom(
                                            primary: value2
                                                ? Colors.lightGreen.shade100
                                                : Colors.lightGreen.shade300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Container(
                            width:350,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green.shade50,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: value3
                                          ? AssetImage("images/hanging_lamp.png",
                                      )
                                          : AssetImage("images/Temphanging_lamp.png"),


                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.topCenter
                                  ),
                                ),
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 350.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          onUpdate3();
                                          writeData("TempLightstate", value3); // write data to firebase to turn on lamp
                                        },
                                        child: value3
                                            ? Text('  Temp-Light ON')
                                            : Text(' Temp-Light OFF'),
                                        style: ElevatedButton.styleFrom(
                                            primary: value3
                                                ? Colors.lightGreen.shade100
                                                : Colors.lightGreen.shade300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width:20),
                          Container(
                            width:350,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green.shade50,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/hanging_lamp.png",
                                      ),

                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.topCenter
                                  ),
                                ),
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 350.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          onUpdate4();
                                          writeData("switch4", value4); // write data to firebase to turn on lamp
                                        },
                                        child: value4
                                            ? Text('  switch ON')
                                            : Text(' switch OFF'),
                                        style: ElevatedButton.styleFrom(
                                            primary: value4
                                                ? Colors.lightGreen.shade100
                                                : Colors.lightGreen.shade300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width:20),


                        ],
                      ),

                    )
                  ],
                ),
              );


              // ignore: missing_return
            }else {
              return Container();
            }


          },
        ),


    );
  }

  //Future<void> onWrite() async {
  // dbRef.child("Data").set(
  //     {"Humidity":0, "Temperature":0}
  //  );
  //  dbRef.child("UVLightstate").set({"switch": !value}); // write data to database to put lights on with relays

  int _index=0;




  //}
  Future<void> writeData(String nameOfLight, bool valueOfLight) async {
    dbRef.child(nameOfLight).set({
      "switch":!valueOfLight
    });
  }


}
