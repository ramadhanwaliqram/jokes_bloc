import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_bloc/bloc/jokes/bloc/jokes_bloc.dart';
import 'package:jokes_bloc/data/repository/jokes_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          JokesBloc(RepositoryProvider.of<JokesRepository>(context))
            ..add(LoadJokesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The Joke App'),
        ),
        body: BlocBuilder<JokesBloc, JokesState>(
          builder: (context, state) {
            if (state is JokesLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is JokesLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ExpansionTile(
                      title: Text(
                        '${state.joke.setup ?? state.joke.joke}',
                        textAlign: TextAlign.center,
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "${state.joke.delivery ?? ""}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<JokesBloc>(context)
                            .add(LoadJokesEvent());
                      },
                      child: const Text('Load New Joke'),
                    ),
                  ],
                ),
              );
            }
            if (state is JokesErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
