import 'package:flutter/material.dart';
import 'package:Ahadees/constants/constant_color.dart';
import 'package:share/share.dart';

class Urdu extends StatefulWidget {
  Urdu(this.kitabid, this.Takhreej, this.arabic, this.English, this.urdu,
      this.Ravi, this.BookEng);
  String kitabid, Takhreej, arabic, English, Ravi, urdu, BookEng;
  @override
  _UrduState createState() => _UrduState();
}

class _UrduState extends State<Urdu> {
  var textSize = 20.0;
  bool toggle = false;
  bool addFavorite = false;

  @override
  Widget build(BuildContext context) {
    String text = widget.urdu +
        "\n" +
        "\n" +
        "Hi, I have found beautiful Islamic App Ahadees on both Play store and App store. Download now by following this link https://play.google.com/store/apps/";
    String subject = 'Ahadees';
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: button_background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    widget.urdu,
                    style: TextStyle(
                        fontFamily: 'SocialSites',
                        fontSize: textSize,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              RaisedButton(
                onPressed: () {
                  if (textSize == 30) {
                    textSize = textSize - 1.0;
                  }
                  setState(() {
                    textSize = textSize + 1.0;
                    print(textSize);
                  });
                },
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: primary_background,
                child: Icon(Icons.zoom_in_outlined),
              ),
              SizedBox(width: 5),
              RaisedButton(
                onPressed: () {
                  if (textSize == 18) {
                    textSize = textSize + 1.0;
                  }
                  setState(() {
                    textSize = textSize - 1.0;
                    print(textSize);
                  });
                },
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: primary_background,
                child: Icon(Icons.zoom_out),
              ),
              SizedBox(width: 5),
              RaisedButton.icon(
                onPressed: () {
                  final RenderBox box = context.findRenderObject();
                  Share.share(text,
                      subject: subject,
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                elevation: 2.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: primary_background,
                icon: Icon(Icons.share),
                label: Text(
                  "Share",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
// _update(int favo, int myint) async {
//   try{
//     await dbconnect.setfavourite(favo,myint);
//   } on DatabaseException catch (e){
//     print("exception");
//   }
// }
}
