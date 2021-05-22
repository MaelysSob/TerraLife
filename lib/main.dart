import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terralife/app/landing_page.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TerraLife',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LandingPage(),
    );
  }
}
