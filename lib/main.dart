import 'package:flutter/material.dart';
import 'data/repository/jokes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentasion/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        backgroundColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: RepositoryProvider(
        create: (context) => JokesRepository(),
        child: Home(),
      ),
    );
  }
}
