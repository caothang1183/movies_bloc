import 'package:dio/dio.dart';
import 'package:movies/common/utils/utils.dart';
import 'package:movies/models/models.dart';
import 'package:movies/repositories/repository_config.dart';

class MovieRepository {
  final Dio _dio = Dio();
  var getPopularURL = "${RepoConfig.rootURl}/movie/top_rated";
  var getMovieURL = "${RepoConfig.rootURl}/discover/movie";
  var getPlayingURL = "${RepoConfig.rootURl}/movie/now_playing";
  var getGenreURL = "${RepoConfig.rootURl}/genre/movie/list";
  var getPersonURL = "${RepoConfig.rootURl}/trending/person.week";

  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": RepoConfig.apiKey,
      "language" : "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getPopularURL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print(getErrorFromAPI(error, stacktrace.toString()));
      return MovieResponse.withError(error);
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      "api_key": RepoConfig.apiKey,
      "language" : "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getPlayingURL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print(getErrorFromAPI(error, stacktrace.toString()));
      return MovieResponse.withError(error);
    }
  }

  Future<MovieResponse> getMoviesByGenre(int id) async {
    var params = {
      "api_key": RepoConfig.apiKey,
      "language" : "en-US",
      "page": 1,
      "with_genres" : id
    };
    try{
      Response response = await _dio.get(getMovieURL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print(getErrorFromAPI(error, stacktrace.toString()));
      return MovieResponse.withError(error);
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": RepoConfig.apiKey,
      "language" : "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getGenreURL, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print(getErrorFromAPI(error, stacktrace.toString()));
      return GenreResponse.withError(error);
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      "api_key": RepoConfig.apiKey,
      "language" : "en-US",
      "page": 1
    };
    try{
      Response response = await _dio.get(getPersonURL, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print(getErrorFromAPI(error, stacktrace.toString()));
      return PersonResponse.withError(error);
    }
  }

}
