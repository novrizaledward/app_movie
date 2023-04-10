import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final String? title;
  final String? release;
  final String? rating;
  final String? slug;
  final String? sinopsis;
  final String? image;

  const SearchEntity({
    required this.title,
    required this.release,
    required this.rating,
    required this.slug,
    required this.sinopsis,
    required this.image,
  });

  @override
  List<Object?> get props => [title, release, rating, slug, sinopsis, image];
}
