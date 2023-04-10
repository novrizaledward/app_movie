import 'package:equatable/equatable.dart';

class InfoEpsEntity extends Equatable {
  final String? videoId;
  final String? episode;
  final String? release;
  final String? title;
  final String? description;

  const InfoEpsEntity({
    required this.videoId,
    required this.episode,
    required this.release,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [videoId, episode, release, title, description];
}
