import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_database/firebase_database.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green.shade300,
        currentIndex: _index,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (int index) {
          setState(() {
            _index =index ;
          });
             if(_index == 2){
               signOut();
             }
          // Respond to item press.
        },
        items: [

          BottomNavigationBarItem(
            title: Text('Timer'),
            icon: Icon(Icons.access_time),
          ),
          BottomNavigationBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            title: Text('LogOut'),
            icon: Icon(Icons.logout),
          ),

        ],
      )


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
