abstract class BaceService{
  final String apiKey='?api_key=b7127c974e817f54236bfa9e44296c31';
  final String baseUrl='https://api.themoviedb.org/3/movie';
  final String genreUrl='https://api.themoviedb.org/3/genre/movie/list';

  Future<dynamic> getResponse(String url);
}