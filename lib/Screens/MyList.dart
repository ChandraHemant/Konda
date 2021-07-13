import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:konda_app/Screens/Details.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/Widgets/Video.dart';
import 'package:shared_preferences/shared_preferences.dart';

String u_id;

void main() async {

  runApp(MyList());
}
class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {

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

  Future<List>getData()async{
    final response = await http
        .post(ApiService.BASE_URL+"My_PlayList", body: {
      "u_id":u_id
    });

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: click ? AppBar(
          title:
            Text(
              'My Play List',
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
        body: FutureBuilder<List>(
        future: getData(),
        // ignore: missing_return
        builder: (ctx,ss) {
          if(ss.hasError)
          {
            print('error');
          }
          else if(ss.hasData){
            return Items(list:ss.data);
          }
          else{
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
    uid = preferences.getString("id");
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
          trailing: IconButton(icon: Icon(Icons.more_vert_outlined),
          onPressed: (){
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 100.0),
                      child: new FlatButton(
                        child: const Text('Remove From Lists'),
                        onPressed: () {
                          removeFromPlayList(list[i]['v_id']);

                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },),
        );
      }
    );
  }



}

removeFromPlayList(list) async {
  final response = await http.post(ApiService.BASE_URL + "Remove_From_PlayList",
      body: {"v_id": list, "u_id": u_id});

  final data = jsonDecode(response.body);
  bool value = data['error'];
  String success = data['success'];
  if (!value) {
    print("Success: " + success);
    removeSuccessToast(success);
  } else {
    removeWarningToast(success);
  }
}


removeSuccessToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white);
}

removeWarningToast(String toast) {
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.yellow,
      textColor: Colors.white);
}
