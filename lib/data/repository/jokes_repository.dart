import 'package:dio/dio.dart';

import '../models/jokes_model.dart';

class JokesRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  final dio = new Dio();

  Future<JokesModel> getJoke() async {
    final response = await dio.get(_baseUrl);
    if (response.statusCode == 200) {
      return JokesModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load joke");
    }
  }
}
