import 'package:app_movie/src/domain/entities/search_entity.dart';

import 'meta_model.dart';

class SearchRespone {
  List<SearchModel>? itemSearch = [];
  MetaModel? meta;

  SearchRespone({this.itemSearch, this.meta});

  SearchRespone.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      itemSearch = <SearchModel>[];
      json['data'].forEach((v) {
        itemSearch!.add(SearchModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
  }
}

class SearchModel extends SearchEntity {
  const SearchModel({
    required String? title,
    required String? release,
    required String? rating,
    required String? slug,
    required String? sinopsis,
    required String? image,
  }) : super(
          title: title,
          release: release,
          rating: rating,
          slug: slug,
          sinopsis: sinopsis,
          image: image,
        );

  SearchModel.fromJson(Map<String, dynamic> json)
      : super(
          title: json['title'],
          release: json['release'],
          rating: json['rating'],
          slug: json['slug'],
          sinopsis: json['sinopsis'],
          image: json['image'],
        );
}
