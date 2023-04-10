import '../../domain/entities/new_release.dart';

class NewReleaseRespone {
  List<NewReleaseModel>? item;

  NewReleaseRespone({this.item});

  NewReleaseRespone.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      item = <NewReleaseModel>[];
      json['data'].forEach((v) {
        item!.add(NewReleaseModel.fromJson(v));
      });
    }
  }
}

class NewReleaseModel extends NewReleaseEntity {
  const NewReleaseModel({
    required String? title,
    required String? release,
    required String? type,
    required String? slug,
    required String? image,
  }) : super(
            title: title,
            release: release,
            type: type,
            slug: slug,
            image: image);

  NewReleaseModel.fromJson(Map<String, dynamic> json)
      : super(
          title: json['title'],
          release: json['release'],
          type: json['type'],
          slug: json['slug'],
          image: json['image'],
        );
}
