import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terralife/app/data_page.dart';
import 'package:terralife/app/settings_page.dart';
import 'package:terralife/app/timer_page.dart';



class HomePage extends StatefulWidget {
  final VoidCallback onSignOut;


  const HomePage({Key key, @required this.onSignOut}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
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
  static const List<Widget> _pages = <Widget>[
    DataPage(),
    TimerPage(),
    SettingsPage(),
    Icon(
      Icons.logout,
      size: 150,
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder(// to listen to data async
        stream: dbRef.child("Data").onValue,// fires when data is updated
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            var temp = snapshot.data.snapshot.value["Temperature"].toString();
            var humidity = snapshot.data.snapshot.value["Humidity"].toString();
            return IndexedStack(
              index: _index,
              children: _pages,
            );


          // ignore: missing_return
          }else {
            return Container();
          }


      },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightGreen.shade100,
        currentIndex: _index,

        selectedItemColor: Colors.lightGreen.shade300,
        unselectedItemColor: Colors.lightGreen.shade300,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (int index) {
          setState(() {
            _index =index ;
          });
          if (_index == 0){
            
          }
          if (_index == 3){
               signOut();
             }
          
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
           label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),

          BottomNavigationBarItem(
            label: 'Timer',
            icon: Icon(Icons.access_time),
          ),

          BottomNavigationBarItem(
          label:  'Settings',
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
           label: 'LogOut',
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
