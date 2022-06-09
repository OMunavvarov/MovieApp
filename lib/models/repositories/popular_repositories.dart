import 'package:movie_api/core/bace_servise.dart';
import 'package:movie_api/models/movie.dart';
import 'package:movie_api/models/popular_service.dart';

class PopularRepository{
  final BaceService _popularSerice=PopularService();
  Future<List<Movie>> fetchPopular() async{
    dynamic response = await _popularSerice.getResponse("/popular");
    final data= response["results"] as List;

    List<Movie> movies=data.map((e) => Movie.fromJson(e)).toList();

    return movies;
  }
}