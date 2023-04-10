import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? title;
  final String? release;
  final String? quality;
  final String? slug;
  final String? image;

  const MovieEntity({
    required this.title,
    required this.release,
    required this.quality,
    required this.slug,
    required this.image,
  });

  @override
  List<Object?> get props => [title, release, quality, slug, image];
}
