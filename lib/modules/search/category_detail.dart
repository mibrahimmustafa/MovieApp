// To parse this JSON data, do
//
//     final categoryDetails = categoryDetailsFromJson(jsonString);

import 'dart:convert';

CategoryDetails categoryDetailsFromJson(String str) => CategoryDetails.fromJson(json.decode(str));

String categoryDetailsToJson(CategoryDetails data) => json.encode(data.toJson());

class CategoryDetails {
  List<Genre> genres;

  CategoryDetails({
    required this.genres,

  });

  factory CategoryDetails.fromJson(Map<String, dynamic> json) => CategoryDetails(
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),

  };

}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
