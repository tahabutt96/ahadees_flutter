import 'package:flutter/material.dart';
import 'package:Ahadees/constants/constant_color.dart';
import 'package:Ahadees/widgets/Arabic.dart';
import 'package:Ahadees/widgets/English.dart';
import 'package:Ahadees/widgets/Ravi.dart';
import 'package:Ahadees/widgets/Urdu.dart';

class bottomnavigation extends StatefulWidget {
  bottomnavigation(this.kitabid, this.Takhreej, this.Arabic, this.English,
      this.Urdu, this.Ravi, this.BookEng);
  String kitabid, Takhreej, Arabic, English, Ravi, Urdu, BookEng;
  @override
  _bottomnavigationState createState() => _bottomnavigationState();
}

class _bottomnavigationState extends State<bottomnavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //var a = widget.textfahekmat;
    //print(a);
    List<Widget> _children = [
      Arabic(widget.kitabid, widget.Takhreej, widget.Arabic, widget.English,
          widget.Ravi, widget.Urdu, widget.BookEng),
      Urdu(widget.kitabid, widget.Takhreej, widget.Arabic, widget.English,
          widget.Ravi, widget.Urdu, widget.BookEng),
      English(widget.kitabid, widget.Takhreej, widget.Arabic, widget.English,
          widget.Ravi, widget.Urdu, widget.BookEng),
      Ravi(widget.kitabid, widget.Takhreej, widget.Arabic, widget.English,
          widget.Ravi, widget.Urdu, widget.BookEng),
      // arabic(widget.textar,widget.id,widget.fav),
      // Urdu(widget.textfa,widget.id,widget.fav),
      // Farsi(widget.textfakhotbe,widget.textfahekmat,widget.textfanameh,widget.id,widget.fav),
    ];
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primary_background,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        // showElevation: true,
        // itemCornerRadius: 8,
        // curve: Curves.easeInBack,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            backgroundColor: primary_background,
            icon: Icon(Icons.assignment_sharp),
            title: Text('Arabic',
                style: TextStyle(
                    fontFamily: 'Lato-Bold', fontWeight: FontWeight.bold)),
          ),
          BottomNavigationBarItem(
            backgroundColor: primary_background,
            icon: Icon(Icons.assignment_sharp),
            title: Text('Urdu',
                style: TextStyle(
                    fontFamily: 'Lato-Bold', fontWeight: FontWeight.bold)),
          ),
          BottomNavigationBarItem(
            backgroundColor: primary_background,
            icon: Icon(Icons.assignment_sharp),
            title: Text('English',
                style: TextStyle(
                    fontFamily: 'Lato-Bold', fontWeight: FontWeight.bold)),
          ),
          BottomNavigationBarItem(
            backgroundColor: primary_background,
            icon: Icon(Icons.assignment_sharp),
            title: Text('Ravi',
                style: TextStyle(
                    fontFamily: 'Lato-Bold', fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
