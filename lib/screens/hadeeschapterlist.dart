import 'package:flutter/material.dart';
import 'package:Ahadees/constants/constant_color.dart';
import 'package:Ahadees/models/ahadees.dart';
import 'package:Ahadees/repositories/database_connection.dart';
import 'package:Ahadees/screens/hadeesdetail.dart';

class hadeeschapterlist extends StatefulWidget {
  hadeeschapterlist(this.kitabid, this.bookur, this.bookeng);
  String kitabid, bookur, bookeng;
  @override
  _hadeeschapterlistState createState() => _hadeeschapterlistState();
}

class _hadeeschapterlistState extends State<hadeeschapterlist> {
  DatabaseConnection dbconnect = DatabaseConnection.instance;
  List<Ahadees> ahadees = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int a = int.parse(widget.kitabid);
    dbconnect.getbukhariinnerList(a).then((rows) {
      setState(() {
        rows.forEach((row) {
          ahadees.add(Ahadees.map(row));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.kitabid);
    var name = widget.bookeng;
    return Scaffold(
      appBar: AppBar(
        title: Text(ahadees.length.toString() + " Hadees Found"),
        backgroundColor: primary_background,
      ),
      body: ListView.builder(
        itemCount: ahadees.length,
        shrinkWrap: true,
        itemBuilder: (context, position) {
          int a = position + 1;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => hadeesdetail(
                              a.toString(),
                              ahadees[position].Takhreej,
                              ahadees[position].Arabic,
                              ahadees[position].English,
                              ahadees[position].Ravi,
                              ahadees[position].Urdu,
                              name.toString())));
                },
                child: Column(
                  children: <Widget>[
                    Container(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text('${ahadees[position].Wazahat}',
                                    style: TextStyle(
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'SocialSites',
                                        color: Colors.black))),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text("Hadees # " + a.toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SocialSites',
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 5),
                          Text('${ahadees[position].English}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'SocialSites',
                                  color: Colors.black)),
                          SizedBox(height: 10),
                          Text("Book Name " + widget.bookeng,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SocialSites',
                                  color: Colors.black)),
                          Text('Hadees No # ' + a.toString(),
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SocialSites',
                                  color: Colors.black)),
                          Text('Status ' + widget.bookur,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SocialSites',
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
