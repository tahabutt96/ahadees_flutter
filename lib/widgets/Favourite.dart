import 'package:flutter/material.dart';
import 'package:Ahadees/constants/constant_color.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        backgroundColor: primary_background,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Text("This Screen is under development by TAHA BUTT")),
      ),
    );
  }
}
