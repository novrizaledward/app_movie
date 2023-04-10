import 'package:app_movie/src/domain/entities/info_eps_entity.dart';

class InfoEpsModel extends InfoEpsEntity {
  const InfoEpsModel({
    required String? videoId,
    required String? episode,
    required String? release,
    required String? title,
    required String? description,
  }) : super(
            videoId: videoId,
            episode: episode,
            release: release,
            title: title,
            description: description);

  InfoEpsModel.fromJson(Map<String, dynamic> json)
      : super(
          videoId: json['video_id'],
          episode: json['episode'],
          release: json['release'],
          title: json['title'],
          description: json['description'],
        );
}
