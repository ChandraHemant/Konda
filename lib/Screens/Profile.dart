import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:konda_app/Screens/Movies.dart';
import 'package:konda_app/Screens/MyList.dart';
import 'package:konda_app/Screens/ProfileUpdate.dart';
import 'package:konda_app/constants.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: ProfileScreen(),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {

  String u_id = '';


  savePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setBool('clickFun',true);
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      u_id = preferences.getString("id");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: ListView(
        children: <Widget>[
          Stack(alignment: Alignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:  AssetImage(
                            "assets/icons/konda.png"), // picked file
                        fit: BoxFit.fill)),
              ),
            ),

          ]),
          Container(
              child: Padding(
            padding: const EdgeInsets.only(
                top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_add_alt,
                    color: Colors.orangeAccent,
                  ),
                  title: Text(
                    'Invite Friends',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    share();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.speaker_notes_sharp,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    'My Play List',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    savePref();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyList(),
                    ));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.event_note_outlined,
                    color: Colors.blueGrey,
                  ),
                  title: Text('Movies', style: TextStyle(fontSize: 20)),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    savePref();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Movies(),
                    ));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Colors.grey,
                  ),
                  title: Text('Update Profile', style: TextStyle(fontSize: 20)),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    savePref();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfileUpdate()));
                  },
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

}

Future<void> share() async {
  await FlutterShare.share(
      title: 'KONDA',
      text: 'Enjoy With KONDA',
      linkUrl:
          'https://play.google.com/store/apps/details?id=in.co.konda.htkc.konda_app',
      chooserTitle: 'Share With Your Friends...');
}




