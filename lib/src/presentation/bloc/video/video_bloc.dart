import 'package:app_movie/src/data/models/video_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final MovieUsecase _movieUsecase;
  VideoBloc(this._movieUsecase) : super(VideoInitial()) {
    on<LoadVideo>((event, emit) async {
      emit(VideoWaiting());
      final result = await _movieUsecase.getVideo(event.id);

      result.fold(
        (l) => emit(VideoError(message: l.toString())),
        (r) => emit(VideoLoaded(videoRespone: r)),
      );
    });
    on<LoadSeriesVideo>((event, emit) async {
      emit(VideoWaiting());
      final result = await _movieUsecase.getSeriesVideo(event.id);

      result.fold(
        (l) => emit(VideoError(message: l.toString())),
        (r) => emit(VideoLoaded(videoRespone: r)),
      );
    });
  }
}
