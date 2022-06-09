import 'package:movie_api/core/bace_servise.dart';
import 'package:movie_api/models/genre.dart';
import 'package:movie_api/models/movie.dart';
import 'package:movie_api/models/popular_genres.dart';
import 'package:movie_api/models/popular_service.dart';

class GenresRepository{
  final BaceService _genresService=PopularGenres();
  Future<List<Genre>> fetchPopular() async{
    dynamic response = await _genresService.getResponse("/genre");
    final data= response["genres"] as List;

    List<Genre> genres=data.map((e) => Genre.fromJson(e)).toList();

    return genres;
  }
}