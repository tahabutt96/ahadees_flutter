import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Ahadees/constants/constant_color.dart';
import 'package:Ahadees/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Ahadees",
            style: TextStyle(
                fontSize: 35,
                color: primary_background,
                fontFamily: 'Lato-Bold')),
      ),
    );
  }
}
