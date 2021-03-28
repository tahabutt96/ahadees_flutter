import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Ahadees/constants/constant_color.dart';
import 'package:Ahadees/constants/constant_text.dart';
import 'package:Ahadees/screens/hadeesbooklist.dart';
import 'package:Ahadees/widgets/Favourite.dart';
import 'package:Ahadees/widgets/aboutus.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  BannerAd myBanner;
  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    myBanner = buildBannerAd()..load();
    //myBanner = buildLargeBannerAd()..load();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  List<String> ahadeeslist = [
    "Al-Bukhari",
    "Al-Muslim",
    "Al-Tirmizi",
    "Abu Dawood",
    "Al-Nasai",
    "Sunna e Ibn e Maja",
    "Mishkat",
    "Sahiha",
    "Musnad"
  ];

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Confirm'),
              content: Text('Do you want to exit the App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false); //Will not exit the App
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    SystemNavigator.pop(); //Will exit the App
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel", style: TextStyle(fontFamily: 'Lato-Bold')),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Purchase", style: TextStyle(fontFamily: 'Lato-Bold')),
      onPressed: () {
        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("In App Purchase", style: TextStyle(fontFamily: 'Lato-Bold')),
      content: Text("Purchase now to enjoy ads free version.",
          style: TextStyle(fontFamily: 'Lato-Regular')),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String text =
      'Hi, I have found beautiful Islamic Ahadees App on both Play store and App store. Download now by following this link https://play.google.com/store/apps/';
  String subject = 'Ahadees';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: primary_text,
        backgroundColor: primary_background,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Favourite()));
            },
          )
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Container(
                  child: Text(
                    "Ahadees",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'Lato-Bold'),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: primary_background,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                'About Us',
                style: TextStyle(fontFamily: 'Lato-Bold'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aboutus()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.more_horiz_sharp),
              title:
                  Text('More Apps', style: TextStyle(fontFamily: 'Lato-Bold')),
              onTap: () {
                _launchURL("https://play.google.com/store/apps/");
              },
            ),
            Divider(),
            // ListTile(
            //   leading: Icon(Icons.monetization_on_outlined),
            //   title: Text('In app Purchase',
            //       style: TextStyle(fontFamily: 'Lato-Bold')),
            //   onTap: () {
            //     showAlertDialog(context);
            //   },
            // ),
            // Divider(),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share', style: TextStyle(fontFamily: 'Lato-Bold')),
              onTap: () {
                final RenderBox box = context.findRenderObject();
                Share.share(text,
                    subject: subject,
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.policy_outlined),
              title: Text('Privacy Policy',
                  style: TextStyle(fontFamily: 'Lato-Bold')),
              onTap: () {
                _launchURL("https://mavrixsol.wixsite.com/privacypolicy");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.rate_review_outlined),
              title: Text('Rate Us', style: TextStyle(fontFamily: 'Lato-Bold')),
              onTap: () {
                _launchURL("https://play.google.com/store/apps/");
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            // margin: const EdgeInsets.only(bottom: 70),
            child: GridView.count(
              childAspectRatio: 10.5 / 9.5,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(ahadeeslist.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                hadeesbooklist(ahadeeslist[index])));
                  },
                  child: Container(
                    child: Card(
                      elevation: 2.5,
                      shadowColor: Colors.grey,
                      color: button_background,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: ListTile(
                              title: Text(
                                ahadeeslist[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontFamily: 'Lato-Bold'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
