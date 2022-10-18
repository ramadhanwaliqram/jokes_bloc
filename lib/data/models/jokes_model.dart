// To parse this JSON data, do
//
//     final jokesModel = jokesModelFromJson(jsonString);

import 'dart:convert';

JokesModel jokesModelFromJson(String str) =>
    JokesModel.fromJson(json.decode(str));

String jokesModelToJson(JokesModel data) => json.encode(data.toJson());

class JokesModel {
  JokesModel({
    this.error,
    this.category,
    this.type,
    this.setup,
    this.joke,
    this.delivery,
    this.flags,
    this.safe,
    this.id,
    this.lang,
  });

  bool? error;
  String? category;
  String? type;
  String? setup;
  String? joke;
  String? delivery;
  Flags? flags;
  bool? safe;
  int? id;
  String? lang;

  factory JokesModel.fromJson(Map<String, dynamic>? json) => JokesModel(
        error: json?["error"],
        category: json?["category"],
        type: json?["type"],
        setup: json?["setup"],
        joke: json?["joke"],
        delivery: json?["delivery"],
        flags: Flags.fromJson(json?["flags"]),
        safe: json?["safe"],
        id: json?["id"],
        lang: json?["lang"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "category": category,
        "type": type,
        "setup": setup,
        "joke": joke,
        "delivery": delivery,
        "flags": flags?.toJson(),
        "safe": safe,
        "id": id,
        "lang": lang,
      };
}

class Flags {
  Flags({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  factory Flags.fromJson(Map<String, dynamic>? json) => Flags(
        nsfw: json?["nsfw"],
        religious: json?["religious"],
        political: json?["political"],
        racist: json?["racist"],
        sexist: json?["sexist"],
        explicit: json?["explicit"],
      );

  Map<String, dynamic> toJson() => {
        "nsfw": nsfw,
        "religious": religious,
        "political": political,
        "racist": racist,
        "sexist": sexist,
        "explicit": explicit,
      };
}
