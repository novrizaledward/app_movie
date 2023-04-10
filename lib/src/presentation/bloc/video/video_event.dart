part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class LoadVideo extends VideoEvent {
  final String id;

  const LoadVideo({required this.id});
}

class LoadSeriesVideo extends VideoEvent {
  final String id;

  const LoadSeriesVideo({required this.id});
}
