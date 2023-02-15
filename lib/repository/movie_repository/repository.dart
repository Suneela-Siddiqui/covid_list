import 'package:covid_list/model/movie_model/movie_response.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final String apiKey = "2027f5dd2c950b2633aecf22326dd76f";
  static String mainUrl = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';

  Future<MovieResponse> getMovies() async {
    var params = {'api_key': apiKey, 'language': 'en-US', 'page': 1};

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

}