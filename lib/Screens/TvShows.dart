import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:konda_app/Screens/HomeScreen.dart';
import 'Movies.dart';
import 'MyList.dart';
import 'package:http/http.dart'as http;
import 'package:konda_app/Service/ApiService.dart';
import 'dart:convert';


class TvShows extends StatefulWidget {
  int navigationIndex = 0;
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  @override
  _MyListState2 createState() => _MyListState2();
}
Future<List> get_movies() async {
  final response = await http.get(ApiService.BASE_URL + "GetMovies");
  return json.decode(response.body);
}

class _MyListState2 extends State<TvShows> {
  int _currentIndex = 0;


  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: new Text('Welcome'),
          backgroundColor: Colors.grey,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.movie_outlined, color: Colors.white, size: 40.0,),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Movies()));
                },
              ),

            ),

            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.library_add, color: Colors.white, size: 40.0),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyList()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.live_tv, color: Colors.white, size: 40.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TvShows()));
                },
              ),
            )
          ],
        ),


        /*<-----------Bottom Navigation Bar----------- >*/



        backgroundColor: Colors.black,
        bottomNavigationBar: new BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.home),
                    disabledColor: Colors.green,
                    onPressed: _currentIndex == 0
                        ? null
                        : () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()))),
                IconButton(
                    icon: GestureDetector(
                        onTap: (){
                          // get_movies();
                        },
                        child: Icon(Icons.search)),
                    disabledColor: Colors.green,
                    onPressed: _currentIndex == 1
                        ? null
                        : () => setState(() => _currentIndex = 1)),
                IconButton(
                    icon: Icon(Icons.settings),
                    disabledColor: Colors.green,
                    onPressed: _currentIndex == 2
                        ? null
                        : () => setState(() => _currentIndex = 2)),
                IconButton(
                    icon: Icon(Icons.download_outlined),
                    disabledColor: Colors.green,
                    onPressed: _currentIndex == 3
                        ? null
                        : () => setState(() => _currentIndex = 3)),
                IconButton(
                    icon: Icon(Icons.more_vert_sharp),
                    disabledColor: Colors.green,
                    onPressed: _currentIndex == 4
                        ? null
                        : () => setState(() => _currentIndex = 4)),
              ],
            )
        ),


      );
    }
  }
