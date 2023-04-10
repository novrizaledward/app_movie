import 'package:equatable/equatable.dart';

class InfoMovieEntity extends Equatable {
  final String? videoId;
  final String? title;
  final String? release;
  final String? duration;
  final String? rating;
  final String? country;
  final String? tagline;
  final String? sinopsis;
  final String? image;

  const InfoMovieEntity({
    required this.videoId,
    required this.title,
    required this.release,
    required this.duration,
    required this.rating,
    required this.country,
    required this.tagline,
    required this.sinopsis,
    required this.image,
  });

  @override
  List<Object?> get props => [
        videoId,
        title,
        release,
        duration,
        rating,
        country,
        tagline,
        sinopsis,
        image
      ];
}
