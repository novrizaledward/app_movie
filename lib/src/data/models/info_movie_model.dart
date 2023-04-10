import 'package:app_movie/src/domain/entities/info_movie_entity.dart';

class InfoMovieModel extends InfoMovieEntity {
  const InfoMovieModel({
    required String? videoId,
    required String? title,
    required String? release,
    required String? duration,
    required String? rating,
    required String? country,
    required String? tagline,
    required String? sinopsis,
    required String? image,
  }) : super(
          videoId: videoId,
          title: title,
          release: release,
          duration: duration,
          rating: rating,
          country: country,
          tagline: tagline,
          sinopsis: sinopsis,
          image: image,
        );

  InfoMovieModel.fromJson(Map<String, dynamic> json)
      : super(
          videoId: json['video_id'],
          title: json['title'],
          release: json['release'],
          duration: json['duration'],
          rating: json['rating'],
          country: json['country'],
          tagline: json['tagline'],
          sinopsis: json['sinopsis'],
          image: json['image'],
        );
}
