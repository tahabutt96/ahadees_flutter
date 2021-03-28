import 'package:flutter/material.dart';
import 'package:Ahadees/constants/constant_color.dart';
import 'package:Ahadees/widgets/bottomnavigation.dart';

class hadeesdetail extends StatefulWidget {
  hadeesdetail(this.kitabid, this.Takhreej, this.Arabic, this.English,
      this.Urdu, this.Ravi, this.BookEng);
  String kitabid, Takhreej, Arabic, English, Ravi, Urdu, BookEng;
  @override
  _hadeesdetailState createState() => _hadeesdetailState();
}

class _hadeesdetailState extends State<hadeesdetail> {
  int initPosition = 0;
  @override
  Widget build(BuildContext context) {
    int a = int.parse(widget.kitabid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_background,
        title: Text(widget.BookEng),
      ),
      body: a == -1
          ? Center(
              child: Text("No Ahadees Found Found.",
                  style: TextStyle(fontFamily: 'Loto-Regular', fontSize: 18)))
          : Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: bottomnavigation(
                  a.toString(),
                  widget.Takhreej,
                  widget.Arabic,
                  widget.English,
                  widget.Ravi,
                  widget.Urdu,
                  widget.BookEng),
            ),
    );
  }
}
