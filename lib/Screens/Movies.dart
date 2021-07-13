import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/Widgets/Video.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'Details.dart';

String u_id = '';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  Future<List> getData() async {
    final response = await http.get(ApiService.BASE_URL + "Movie_List");
    return json.decode(response.body);
  }

  bool click;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      u_id = preferences.getString("id");
      click = preferences.getBool('clickFun');
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
      appBar: click ? AppBar(
        title:
        Text(
          'Movies',
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
      ) : PreferredSize(preferredSize: Size(0.0, 0.0),child: Container(),),
      body: Container(
        height: double.infinity,
        child: FutureBuilder<List>(
          future: getData(),
          // ignore: missing_return
          builder: (ctx, ss) {
            if (ss.hasError) {
              print('error');
            }
            if (ss.hasData) {
              return Items(list: ss.data);
            } else {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  videoDetail(
      String f_id,
      String f_title,
      String f_year,
      String f_starring,
      String f_descr,
      String f_age,
      String f_rating,
      String f_director,
      String f_genre,
      String f_poster,
      String f_run,
      String f_season) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("f_id", f_id);
    preferences.setString("f_title", f_title);
    preferences.setString("f_year", f_year);
    preferences.setString("f_descr", f_descr);
    preferences.setString("f_starring", f_starring);
    preferences.setString("f_age", f_age);
    preferences.setString("f_rating", f_rating);
    preferences.setString("f_director", f_director);
    preferences.setString("f_genre", f_genre);
    preferences.setString("f_poster", f_poster);
    preferences.setString("f_run", f_run);
    preferences.setString("f_season", f_season);
    // print("Seasion: "+f_season);
  }

  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: width / (height * 1.13)),
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.only(top:8.0,),
            child: Column(
              children: [
                Card(
                  child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        videoDetail(
                            list[i]['v_id'],
                            list[i]['v_title'],
                            list[i]['year'],
                            list[i]['v_starring'],
                            list[i]['v_description'],
                            list[i]['v_age'],
                            list[i]['v_rating'],
                            list[i]['v_director'],
                            list[i]['v_genre'],
                            list[i]['v_poster'],
                            list[i]['v_run'],
                            list[i]['v_season']);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details()));
                      },
                      child: Container(
                        width: 100,
                        child: Column(children: [
                          Image.network(ApiService.BASE_URL + list[i]['v_poster'],
                              height: 124.0, width: 100.0, fit: BoxFit.cover),
                          LinearProgressIndicator(value: 50.0),
                        ]),
                      )),
                ),
                Card(
                  child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Image.network(
                                        ApiService.BASE_URL +
                                            list[i]['v_poster'],
                                        fit: BoxFit.cover),
                                    actions: [
                                      Column(
                                        children: [
                                          Center(
                                              child: new Text("Title: " +
                                                  list[i]['v_title'])),
                                        ],
                                      ),
                                      Center(
                                          child: new Text("Duration: " +
                                              list[i]['v_run'])),
                                      Row(
                                        children: [
                                          new FlatButton(
                                            child: const Text(""),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    15)),
                                            child: FlatButton.icon(
                                                onPressed: () => Navigator
                                                    .pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                            Videoplayer())),
                                                icon: Icon(
                                                    Icons
                                                        .play_arrow_outlined,
                                                    size: 30,
                                                    color: Colors.black),
                                                label: Text('Play',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                              icon: Icon(
                                Icons.info_outline_rounded,
                                size: 22.0,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 100.0),
                                        child: new FlatButton(
                                          child: const Text(
                                              '+ Add To Play List'),
                                          onPressed: () {
                                            addToPlayList(list[i]['v_id'],
                                                list[i]['v_title']);

                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              icon: Icon(
                                Icons.more_vert_sharp,
                                size: 22.0,
                                color: Colors.white,
                              )),
                        ],
                      )
                  ),
                ),
              ],
            ),

          );
        },
      ),
    );
  }
}

addToPlayList(list, list2) async {
  final response = await http.post(ApiService.BASE_URL + "Add_PlayList",
      body: {"v_id": list, "v_title": list2, "u_id": u_id});

  final data = jsonDecode(response.body);
  bool value = data['error'];
  String success = data['success'];
  if (!value) {
    print("Success: " + success);
    addedSuccessToast(success);
  } else {
    addedSuccessToast(success);
  }
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
