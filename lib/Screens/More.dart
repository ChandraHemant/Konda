import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:konda_app/Model/MovieModel.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/Widgets/GridView.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  Future<List> getData() async {
    final response = await http.get(ApiService.BASE_URL+"Movie_List");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<MovieModel>>(
              future: ApiService.getMovie(),
              builder: (context, snapshot) {
                // not setstate here
                //
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                //
                if (snapshot.hasData) {
                  // streamController.sink.add(snapshot.data.length);
                  // gridview
                  return gridview(snapshot);
                }

                return circularProgress();
              },
            ),
          ),
        ],
      ),
    );
  }
  gridview(AsyncSnapshot<List<MovieModel>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
              (movieModel) {
            child: GridTile(
              child: MovieCell(this.context,movieModel),
            );
          },
        ).toList(),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}
