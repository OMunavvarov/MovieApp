import 'package:flutter/material.dart';
import 'package:movie_api/core/api_response.dart';
import 'package:movie_api/models/genre.dart';
import 'package:movie_api/models/repositories/genres_repositories.dart';
import 'package:movie_api/models/repositories/popular_repositories.dart';

import '../models/movie.dart';

class MainViewModel extends ChangeNotifier{
  ApiResponse _apiResponse=ApiResponse.initial('Loading');
  List<Movie> _movies=[];
  List<Genre> _genres=[];
   List<Movie> get movies{
     return _movies;
   }
   List<Genre> get genres{
     return _genres;
   }
   ApiResponse get response{
     return _apiResponse;
   }

   Future fetchPopular() async{
     try{
       List<Movie> movies=await PopularRepository().fetchPopular();
       _movies=movies;
       _apiResponse=ApiResponse.completed(movies.toString());
     }catch (e){
      _apiResponse=ApiResponse.error(e.toString());
     }notifyListeners();
   }
   Future fetchGenres() async{
     try{
       List<Genre> genres=await GenresRepository().fetchPopular();
       _genres=genres;
       _apiResponse=ApiResponse.completed(genres.toString());
     }catch (e){
      _apiResponse=ApiResponse.error(e.toString());
     }notifyListeners();
   }
}