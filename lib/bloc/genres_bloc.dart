 import 'package:movies/models/models.dart';
import 'package:movies/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class GenresBloc {
  final MovieRepository _repository = MovieRepository();
    final BehaviorSubject<GenreResponse> _subject = BehaviorSubject<GenreResponse>();

    getGenres() async {
      GenreResponse response = await _repository.getGenres();
      _subject.sink.add(response);
    }

    dispose(){
      _subject.close();
    }

    BehaviorSubject<GenreResponse> get subject => _subject;
 }

 final genresBloc = GenresBloc();