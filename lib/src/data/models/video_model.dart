import 'package:app_movie/src/domain/entities/video_entity.dart';

class VideoRespone {
  String? embed;
  List<VideoModel>? item;

  VideoRespone({this.embed, this.item});

  VideoRespone.fromJson(Map<String, dynamic> json) {
    embed = json['embed'];
    if (json['item'] != null) {
      item = <VideoModel>[];
      json['item'].forEach((v) {
        item!.add(VideoModel.fromJson(v));
      });
    }
  }
}

class VideoModel extends VideoEntity {
  const VideoModel({
    required String? title,
    required String? url,
  }) : super(title: title, url: url);

  VideoModel.fromJson(Map<String, dynamic> json)
      : super(
          title: json['title'],
          url: json['url'],
        );
}
