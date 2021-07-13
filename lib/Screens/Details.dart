import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:konda_app/Screens/MyList.dart';
import 'package:konda_app/constants.dart';
import 'package:konda_app/Widgets/Video.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shared_preferences/shared_preferences.dart';

String uid = '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(DarkPrimaryColor);
    return ThemeProvider(
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: Details(),
          );
        },
      ),
    );
  }
}

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String id,
      title,
      genre,
      director,
      year,
      rating,
      descr,
      staring,
      poster,
      age,
      duration,
      season;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      uid = preferences.getString("id");
      id = preferences.getString("f_id");
      title = preferences.getString("f_title");
      genre = preferences.getString("f_genre");
      director = preferences.getString("f_director");
      year = preferences.getString("f_year");
      rating = preferences.getString("f_rating");
      descr = preferences.getString("f_descr");
      staring = preferences.getString("f_starring");
      poster = preferences.getString("f_poster");
      age = preferences.getString("f_age");
      season = preferences.getString("f_season");
      duration = preferences.getString("f_run");
/*      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text(preferences.getString("f_id") +
                " " +
                preferences.getString("f_title") +
                " " +
                preferences.getString("f_year") +
                " " +
                preferences.getString("f_descr") +
                " " +
                preferences.getString("f_starring") +
                " " +
                preferences.getString("f_rating") +
                " " +
                preferences.getString("f_director") +
                " " +
                preferences.getString("f_genre")),
          );
        },
      );*/
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
        body: CustomScrollView(          //
          controller: ScrollController(initialScrollOffset: 0),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top:28.0),
                  child: Image.asset("assets/images/logos.png",),
                ),
              ),
              expandedHeight: 57,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => Column(
                    children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 225,
                              width: 150,
                              child: Image.network(ApiService.BASE_URL + poster),
                            ),

                            /*<-----------Mid Row----------->*/

                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, top: 8),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(title,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only( top: 8),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("Duration: " + duration,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontSize: 15)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0, left: 4.0, right: 4.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(year,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(age,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                    Text(season,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Text(" | " + genre,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),

                            /*<-----------Play Button----------->*/

                            Padding(
                              padding:
                              const EdgeInsets.only(right: 25, left: 25, top: 25.0),
                              child: Container(
                                height: 35,
                                width: 400,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: FlatButton.icon(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Videoplayer())),
                                    icon: Icon(Icons.play_arrow_outlined,
                                        size: 30, color: Colors.black),
                                    label: Text('Play',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),

                            /*<-----------Content----------->*/

                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, left: 30, right: 20, bottom: 20),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(descr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white)),
                                    ])
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 50,
                                  child: Text(staring,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ),

                            /*<-----------Last Row----------->*/

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          addToPlayList(id, title);
                                        },
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.add, color: Colors.white),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                'Add to List',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: null,
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.thumb_up_alt_outlined,
                                                color: Colors.white),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                rating,
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey.shade500,
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),

                        /*<-----------backgroung image----------->*/

                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  ApiService.BASE_URL + poster,
                                ),
                                fit: BoxFit.cover,
                                colorFilter:
                                ColorFilter.mode(Colors.black54, BlendMode.darken))),
                      ),
                    ],
                  ),
                  childCount: 1,
                ))
          ],
        ));
  }

  addToPlayList(list, list2) async {
    final response = await http.post(ApiService.BASE_URL + "Add_PlayList",
        body: {"v_id": list, "v_title": list2, "u_id": uid});

    final data = jsonDecode(response.body);
    bool value = data['error'];
    String success = data['success'];
    if (!value) {
      print("Success: " + success);
      addedSuccessToast(success);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyList()));
    } else {
      addedWarningToast(success);
    }
  }
}

addedWarningToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.amber,
      textColor: Colors.white);
}

addedSuccessToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white);
}

Future<void> share() async {
  await FlutterShare.share(
      title: 'Example share',
      text: 'Example share text',
      linkUrl: 'https://flutter.dev/',
      chooserTitle: 'Share With Your Friends...');
}
