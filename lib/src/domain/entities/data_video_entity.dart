import 'package:app_movie/src/domain/entities/video_entity.dart';
import 'package:equatable/equatable.dart';

class DataVideoEntity extends Equatable {
  final String? embed;
  final List<VideoEntity>? item;

  const DataVideoEntity({required this.embed, required this.item});

  @override
  List<Object?> get props => [embed, item];
}
