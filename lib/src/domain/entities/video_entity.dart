import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String? title;
  final String? url;

  const VideoEntity({
    required this.title,
    required this.url,
  });

  @override
  List<Object?> get props => [title, url];
}
