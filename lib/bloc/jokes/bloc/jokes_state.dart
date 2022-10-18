part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

class JokesInitial extends JokesState {}

class JokesLoadingState extends JokesState {
  @override
  List<Object> get props => [];
}

class JokesLoadedState extends JokesState {
  final JokesModel joke;

  JokesLoadedState(this.joke);

  @override
  List<Object> get props => [joke];
}

class JokesErrorState extends JokesState {
  final String error;

  JokesErrorState(this.error);

  @override
  List<Object> get props => [error];
}
