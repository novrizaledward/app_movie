part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoWaiting extends VideoState {}

class VideoError extends VideoState {
  final String? message;

  const VideoError({this.message});
}

class VideoLoaded extends VideoState {
  final VideoRespone videoRespone;

  const VideoLoaded({required this.videoRespone});
}
