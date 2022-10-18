import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_bloc/data/repository/jokes_repository.dart';

import '../../../data/models/jokes_model.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  final JokesRepository _jokesRepository;

  JokesBloc(this._jokesRepository) : super(JokesInitial()) {
    on<JokesEvent>((event, emit) {});

    on<LoadJokesEvent>((event, emit) async {
      emit(JokesLoadingState());

      try {
        final jokes = await _jokesRepository.getJoke();
        emit(JokesLoadedState(jokes));
      } catch (e) {
        emit(JokesErrorState(e.toString()));
      }
    });
  }
}
