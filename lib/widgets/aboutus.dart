import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:Ahadees/constants/constant_color.dart';

class aboutus extends StatelessWidget {
  void openEmailApp(BuildContext context) {
    try {
      AppAvailability.launchApp(
              Platform.isIOS ? "message://" : "com.google.android.gm")
          .then((_) {
        print("App Email launched!");
      }).catchError((err) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("App Email not found!")));
        print(err);
      });
    } catch (e) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Email App not found!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_background,
        title: Text("About Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Icon(
                  Icons.device_unknown,
                  color: Colors.black,
                  size: 40,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Version: 1.21.1",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontFamily: 'Loto-Regular'),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Email: ahadeeslive@gmail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontFamily: 'Loto-Regular'),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                    child: Text(
                      "Email Us",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    color: primary_background,
                    onPressed: () {
                      print("A");
                      openEmailApp(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
