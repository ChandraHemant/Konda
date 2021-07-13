import 'package:flutter/material.dart';
import 'package:konda_app/Model/MovieModel.dart';

class MovieCell extends StatelessWidget {
  const MovieCell(this.context, this.movieModel);
  @required
  final MovieModel movieModel;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding:
        EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Image.network(
                  movieModel.v_poster,
                  width: 150,
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  movieModel.v_title,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}