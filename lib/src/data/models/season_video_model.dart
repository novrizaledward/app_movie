import 'package:app_movie/src/domain/entities/season_video_entity.dart';

class SeasonVideoModel extends SeasonVideoEntity {
  const SeasonVideoModel(
      {required String? image,
      required String? episode,
      required String? title,
      required String? release,
      required String? slug})
      : super(
            image: image,
            episode: episode,
            title: title,
            release: release,
            slug: slug);

  SeasonVideoModel.fromJson(Map<String, dynamic> json)
      : super(
          image: json['image'],
          episode: json['episode'],
          title: json['title'],
          release: json['release'],
          slug: json['slug'],
        );
}
