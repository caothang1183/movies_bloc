 import 'package:movies/models/models.dart';
import 'package:movies/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class PersonsBloc {
  final MovieRepository _repository = MovieRepository();
    final BehaviorSubject<PersonResponse> _subject = BehaviorSubject<PersonResponse>();

    getGenres() async {
      PersonResponse response = await _repository.getPersons();
      _subject.sink.add(response);
    }

    dispose(){
      _subject.close();
    }

    BehaviorSubject<PersonResponse> get subject => _subject;
 }

 final personsBloc = PersonsBloc();