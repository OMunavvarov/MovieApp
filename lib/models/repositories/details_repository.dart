import 'package:movie_api/core/bace_servise.dart';
import 'package:movie_api/models/detail_service.dart';
import 'package:movie_api/models/details.dart';
import 'package:movie_api/models/genre.dart';
import 'package:movie_api/models/movie.dart';
import 'package:movie_api/models/popular_genres.dart';
import 'package:movie_api/models/popular_service.dart';

class DetailsRepository{
  final BaceService _detailsService=DetailsService();
  Future<Details> fetchDetails(movieId) async{
    dynamic response = await _detailsService.getResponse("/$movieId");
    final details= Details.fromJson(response);
    return details;
  }
}