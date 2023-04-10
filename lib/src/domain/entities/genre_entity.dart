import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final String? name;
  final String? slug;
  final String? image;

  const GenreEntity({
    required this.name,
    required this.slug,
    required this.image,
  });

  @override
  List<Object?> get props => [name, slug, image];
}
