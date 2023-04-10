import 'package:app_movie/src/domain/entities/info_movie_entity.dart';
import 'package:app_movie/src/domain/entities/related_post_entity.dart';
import 'package:equatable/equatable.dart';

class MovideDetailEntity extends Equatable {
  final InfoMovieEntity? info;
  final List<String>? genre;
  final RelatedPostEntity? relatedPost;

  const MovideDetailEntity({
    required this.info,
    required this.genre,
    required this.relatedPost,
  });

  @override
  List<Object?> get props => [
        info,
        genre,
        relatedPost,
      ];
}
