import 'package:equatable/equatable.dart';

class SeasonVideoEntity extends Equatable {
  final String? image;
  final String? episode;
  final String? title;
  final String? release;
  final String? slug;

  const SeasonVideoEntity({
    required this.image,
    required this.episode,
    required this.title,
    required this.release,
    required this.slug,
  });

  @override
  List<Object?> get props => [image, episode, title, release, slug];
}
