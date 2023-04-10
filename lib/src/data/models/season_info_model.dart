import 'package:app_movie/src/data/models/season_video_model.dart';

class SeasonModel {
  String? number;
  String? name;
  List<SeasonVideoModel>? seasonVideo = [];

  SeasonModel.fromJson(Map<String, dynamic> json) {
    number = json['number'] ?? "";
    name = json['name'] ?? "";
    if (json['video'] != null) {
      seasonVideo = <SeasonVideoModel>[];
      json['video'].forEach((v) {
        seasonVideo!.add(SeasonVideoModel.fromJson(v));
      });
    }
  }
}
