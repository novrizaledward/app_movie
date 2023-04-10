import 'package:app_movie/src/domain/entities/related_post_entity.dart';

class RelatedPostModel extends RelatedPostEntity {
  const RelatedPostModel({
    required String path,
    required String url,
  }) : super(
          path: path,
          url: url,
        );

  RelatedPostModel.fromJson(Map<String, dynamic> json)
      : super(
          path: json['path'],
          url: json['url'],
        );
}
