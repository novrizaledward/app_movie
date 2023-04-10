import 'package:app_movie/src/domain/entities/genre_entity.dart';

class GenreRespone {
  List<GenreModel>? itemGenre = [];

  GenreRespone({this.itemGenre});

  GenreRespone.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      itemGenre = <GenreModel>[];
      json['data'].forEach((v) {
        itemGenre!.add(GenreModel.fromJson(v));
      });
    }
  }
}

class GenreModel extends GenreEntity {
  const GenreModel({
    required String? name,
    required String? slug,
    required String? image,
  }) : super(
          name: name,
          slug: slug,
          image: image,
        );

  GenreModel.fromJson(Map<String, dynamic> json)
      : super(
          name: json['name'],
          slug: json['slug'],
          image: json['image'],
        );
}
