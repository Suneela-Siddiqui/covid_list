import 'package:covid_list/model/movie_model/movie_response.dart';
import 'package:covid_list/repository/movie_repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListBloc {
  final MovieRepository _movieRepository =  MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _movieRepository.getMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

    BehaviorSubject<MovieResponse> get subject => _subject;

    final moviesBloc = MoviesListBloc();


}