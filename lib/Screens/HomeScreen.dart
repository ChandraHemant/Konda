import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda_app/Screens/Movies.dart';
import 'package:konda_app/Widgets/Video.dart';
import 'package:konda_app/constants.dart';
import 'dart:convert';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/Screens/Details.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:konda_app/Screens/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

String u_id = '';

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
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*<-------------Center Body-------------->*/

  Future<List> getMovie() async {
    final response = await http.get(ApiService.BASE_URL + "Movie_List");
    return json.decode(response.body);
  }

  Future<List> popularMovie() async {
    final response = await http.get(ApiService.BASE_URL + "Popular_Movie_List");
    return json.decode(response.body);
  }

  Future<List> getSlider() async {
    final response = await http.get(ApiService.BASE_URL + "Slider_List");
    return json.decode(response.body);
  }

  Future<List> getCategory() async {
    final response = await http.get(ApiService.BASE_URL + "Category_list");
    return json.decode(response.body);
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
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              constraints: BoxConstraints.expand(height: 225),
              child: FutureBuilder<List>(
                future: getSlider(),

                // ignore: missing_return
                builder: (ctx, ss) {
                  if (ss.hasError) {
                    print('error');
                  }
                  if (ss.hasData) {
                    return ImageSlider(list: ss.data);
                  } else {
                    return Center(
                      child: const CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),

        /*   <----------------Animated------------->*/

          SliverToBoxAdapter(
            child: SizedBox(
              height: 425.0,
              child: FutureBuilder<List>(
                future: getCategory(),

                // ignore: missing_return
                builder: (ctx, ss) {
                  print("Aya");
                  if (ss.hasError) {
                    print(ss.error);
                  }
                  if (ss.hasData) {
                    return Categories(list: ss.data);
                  } else {
                    return Center(
                      child: const CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),

      /*SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              constraints: BoxConstraints.expand(height: 200),
              child: FutureBuilder<List>(
                future: getSlider(),

                // ignore: missing_return
                builder: (ctx, ss) {
                  if (ss.hasError) {
                    print('error');
                  }
                  if (ss.hasData) {
                    return ImageSlider(list: ss.data);
                  } else {
                    return Center(
                      child: const CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 425.0,
              child: FutureBuilder<List>(
                future: getCategory(),

                // ignore: missing_return
                builder: (ctx, ss) {
                  print("Aya");
                  if (ss.hasError) {
                    print(ss.error);
                  }
                  if (ss.hasData) {
                    return Categories(list: ss.data);
                  } else {
                    return Center(
                      child: const CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),*/


    );
  }

  //  Action on Bottom Bar Press
  void reds(selectedIndex) {
//    print(selectedIndex);

    switch (selectedIndex) {
      case "TAB: 0":
        {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }

        break;

      case "TAB: 1":
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Movies()));
        }
        break;

      case "TAB: 2":
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        }
        break;
    }
  }
}

/*<--------Slider-------------->*/

// ignore: must_be_immutable
class ImageSlider extends StatelessWidget {
  List list;

  ImageSlider({this.list});

  Future<List> getAnimated(list) async {
    final response = await http
        .post(ApiService.BASE_URL + "Animated_List", body: {"c_id": list});
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Swiper(
      autoplay: true,
      layout: SwiperLayout.STACK,
      itemWidth: 330.0,
      itemHeight: 150.0,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return GestureDetector(
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

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Details()));
          },
          child: new Image.network(
            ApiService.BASE_URL + list[i]['v_poster'],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

/*<-------------Cards----------->*/

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  List list;

  Categories({this.list});

  Future<List> getAnimated(list) async {
    final response = await http.post(
        ApiService.BASE_URL + "CategoryWise_movieList",
        body: {"c_id": list});
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(list[i]['c_title'],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 200,
                child: FutureBuilder<List>(
                  future: getAnimated(list[i]['c_id']),

                  // ignore: missing_return
                  builder: (ctx, ss) {
                    // print("Aya");
                    if (ss.hasError) {
                      print(ss.error);
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
            )
          ],
        );
      },
    );
  }
}

class Items extends StatelessWidget {
  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
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
                    Row(
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
                  ]),
                )),
          ),
        );
      },
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
