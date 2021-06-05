import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'package:intl/date_time_patterns.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  TimeOfDay _currentTime = TimeOfDay.now();
 void _setTimeBegin() async{
   final  TimeOfDay  _newTimeBegin = await showTimePicker(context: context, initialTime: _currentTime);
 }
 void _setTimeEnd() async{
   final TimeOfDay _newTimeEnd = await showTimePicker(context: context, initialTime:_currentTime );
 }



  bool automation = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
            child: Row(
              children: [
                Card(
                  child: Checkbox(
                      value: automation,
                      onChanged: (value) {
                        setState(() {
                          automation = !automation;
                        });
                      }),
                ),
                Text(
                  " check for automation ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen.shade300,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left:140, top: 15, right: 140),
              child:
                ElevatedButton(onPressed: _setTimeBegin, child: Text("Select Begin time"))
            ),

          ),
        ],
      ),
    );
  }
}
