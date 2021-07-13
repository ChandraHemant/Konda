import 'package:konda_app/Service/ApiService.dart';

class MovieModel{
  String v_id;
  String v_title;
  String v_url;
  String v_descr;
  String v_director;
  String year;
  String v_genre;
  String v_starring;
  String v_rating;
  String v_run;
  String v_poster;
  String success;
  bool error;

  MovieModel({
      this.v_id,
      this.v_title,
      this.v_url,
      this.v_descr,
      this.v_director,
      this.year,
      this.v_genre,
      this.v_starring,
      this.v_rating,
      this.v_run,
      this.v_poster,
      this.success,
      this.error});


  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(v_id: json['v_id'],
    v_title: json['v_title'],
    v_url: ApiService.BASE_URL+json['v_url'],
    v_descr: json['v_descr'],
    v_director: json['v_director'],
    year: json['year'],
    v_genre: json['v_genre'],
    v_starring: json['v_starring'],
    v_rating: json['v_rating'],
    v_run: json['v_run'],
    v_poster: ApiService.BASE_URL+json['v_poster'],
    success: json['success'],
    error: json['error']);

  }
  Map<String, dynamic> toJsonAdd(){
     return{
       'v_id':v_id,
       'v_title':v_title,
       'v_url':v_url,
       'v_descr':v_descr,
       'v_director':v_director,
       'year':year,
       'v_genre':v_genre,
       'v_starring':v_starring,
       'v_rating':v_rating,
       'v_run':v_run,
       'v_poster':v_poster,
       'success':success,
       'error':error,
     };
   }
    Map<String, dynamic> toJsonDelete(){
      return{
        'v_id':v_id,
        'v_title':v_title,
        'v_url':v_url,
        'v_descr':v_descr,
        'v_director':v_director,
        'year':year,
        'v_genre':v_genre,
        'v_starring':v_starring,
        'v_rating':v_rating,
        'v_run':v_run,
        'v_poster':v_poster,
        'success':success,
        'error':error,
      };
  }
}