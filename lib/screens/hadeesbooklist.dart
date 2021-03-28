import 'package:flutter/material.dart';
import 'package:Ahadees/constants/constant_color.dart';
import 'package:Ahadees/models/ahadees.dart';
import 'package:Ahadees/repositories/database_connection.dart';
import 'package:Ahadees/screens/hadeeschapterlist.dart';

class hadeesbooklist extends StatefulWidget {
  hadeesbooklist(this.hadeesid);
  String hadeesid;
  @override
  _hadeesbooklistState createState() => _hadeesbooklistState();
}

class _hadeesbooklistState extends State<hadeesbooklist> {
  DatabaseConnection dbconnect = DatabaseConnection.instance;
  List<Ahadees> ahadees = new List();
  List<Ahadees> _searchResult = [];
  TextEditingController controller = new TextEditingController();

  Widget _buildSearchResults() {
    return new ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, i) {
        int ab = i + 1;
        return new Card(
          child: new ListTile(
            leading: CircleAvatar(
              radius: 23,
              backgroundColor: primary_background,
              child: Text(
                ab.toString(),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            title: Directionality(
                textDirection: TextDirection.ltr,
                child: new Text(_searchResult[i].Kitab)),
            subtitle: new Text(_searchResult[i].Kitab_Eng),
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        child: new ListTile(
          leading: new Icon(Icons.search),
          title: new TextField(
            controller: controller,
            decoration: new InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    ahadees.forEach((userDetail) {
      if (userDetail.Kitab.toUpperCase().contains(text.toUpperCase()) ||
          userDetail.Kitab_Eng.toUpperCase().contains(text.toUpperCase()))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.hadeesid == "Al-Bukhari") {
      dbconnect.getbukharichapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Al-Muslim") {
      dbconnect.getalmuslimchapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Al-Tirmizi") {
      dbconnect.gettirmazichapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Abu Dawood") {
      dbconnect.getabudawoodchapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Al-Nasai") {
      dbconnect.getalnasaichapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Sunna e Ibn e Maja") {
      dbconnect.getibnemajachapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Mishkat") {
      dbconnect.getmishkatchapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Sahiha") {
      dbconnect.getsahihachapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    } else if (widget.hadeesid == "Musnad") {
      dbconnect.getmusnadchapterList().then((rows) {
        setState(() {
          rows.forEach((row) {
            ahadees.add(Ahadees.map(row));
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var hadeestitle = widget.hadeesid;
    return Scaffold(
        appBar: AppBar(
          title: Text(hadeestitle),
          backgroundColor: primary_background,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(color: primary_background, child: _buildSearchBox()),
            new Expanded(
              child: _searchResult.length != 0 || controller.text.isNotEmpty
                  ? _buildSearchResults()
                  : ListView.builder(
                      itemCount: ahadees.length,
                      shrinkWrap: true,
                      itemBuilder: (context, position) {
                        int a = position + 1;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              //Divider(height: 2.0,),
                              Material(
                                color: button_background,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                hadeeschapterlist(
                                                    ahadees[position]
                                                        .Kitab_ID
                                                        .toString(),
                                                    ahadees[position].BookUR,
                                                    ahadees[position]
                                                        .BookEng)));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: button_background,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 23,
                                        backgroundColor: primary_background,
                                        child: Text(
                                          a.toString(),
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, bottom: 15),
                                        child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              '${ahadees[position].Kitab}',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'SocialSites',
                                                  color: Colors.black),
                                            )),
                                      ),
                                      subtitle: Text(
                                        '${ahadees[position].Kitab_Eng}',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'SocialSites',
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ));
  }
}
