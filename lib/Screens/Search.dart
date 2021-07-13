import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda_app/Screens/Details.dart';
import 'dart:convert';

import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/Widgets/Video.dart';
import 'package:konda_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String movies, usrSearch= '';
  final _key = new GlobalKey<FormState>();
  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      search();
    }
  }

  search() async {
    final response = await http
        .post(ApiService.BASE_URL+"SearchMovies", body: {
      "movies": movies,
    });
    final data = jsonDecode(response.body);
  }
  Future<List> get_movies() async {
    final response = await http.get(ApiService.BASE_URL + "GetMovies");
    return jsonDecode(response.body);
  }

  Future<List> search_movies() async {
    print("search: "+usrSearch);
    final response = await http.post(ApiService.BASE_URL + "SearchMovies", body: {
      "search" : usrSearch,
    });
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  int _selectedPageIndex = 0;
  bool _isSearching = false;
  final searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: DarkSecondaryColor,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title: !_isSearching
            ? Column(
              children: [
                Image.asset(
                    'assets/images/logos.png',
                    fit: BoxFit.contain,
                    height: 32,
                  ),
              ],
            )
            : TextFormField(
              onChanged: (value) {
                usrSearch = value;

              },
              decoration: InputDecoration(
                labelText: 'Search Here',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),


              controller: searchController,
              // onFieldSubmitted: _handleSubmitted,
            ),

            actions: !_isSearching ? <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  }),
            ]: <Widget>[

            ]
      ),


      body: FutureBuilder<List>(

        future: search_movies(),

        // ignore: missing_return
        builder: (ctx, ss) {
          if (ss.hasError) {
            print('error');
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
    );
  }
}


class Items extends StatelessWidget {

  List list;
  videoDetail(String f_id,String f_title,String f_year,String f_starring,String f_descr,String f_age,String f_rating,String f_director,String f_genre,String f_poster,String f_run,String f_season) async {
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

  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list==null?0:list.length,
        itemBuilder: (ctx,i){
          return ListTile(
            leading: GestureDetector(
                onTap: ()=> showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:Image.network(ApiService.BASE_URL + list[i]['v_poster'],
                          fit: BoxFit.cover),
                      actions: [
                        Column(
                          children: [
                            Center(child: new Text("Title: "+list[i]['v_title'])),
                          ],
                        ),
                        Center(child: new Text("Duration: "+list[i]['v_run'])),
                        Row(
                          children: [
                            new FlatButton(
                              child: const Text(""),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25, left: 40, top: 25.0, bottom: 30.0),
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: FlatButton.icon(
                                    onPressed: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Videoplayer())),
                                    icon: Icon(Icons.play_arrow_outlined,
                                        size: 30, color: Colors.black),
                                    label: Text('Play',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold))),
                              ),
                            ),

                          ],
                        ),
                      ],
                    );
                  },
                ),
                child: Image.network(ApiService.BASE_URL+list[i]['v_poster'])),
            title: Text(list[i]['v_title']),
            subtitle: Text(list[i]['year']),
            onTap:  () {
              videoDetail(list[i]['v_id'],list[i]['v_title'],list[i]['year'],
                  list[i]['v_starring'],list[i]['v_description'],list[i]['v_age'],
                  list[i]['v_rating'],list[i]['v_director'],list[i]['v_genre'],
                  list[i]['v_poster'],list[i]['v_run'],list[i]['v_season']);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Details()));
            },
          );
        }
    );
  }
}
