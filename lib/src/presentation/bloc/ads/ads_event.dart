part of 'ads_bloc.dart';

abstract class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}

class LoadPopRoute extends AdsEvent {
  final BuildContext context;

  const LoadPopRoute({required this.context});
}

class LoadPushReplaceNamedRoute extends AdsEvent {
  final BuildContext context;
  final AuthEntity entity;
  final String path;

  const LoadPushReplaceNamedRoute(this.context, this.entity, this.path);
}

class LoadPushNamedRoute extends AdsEvent {
  final BuildContext context;
  final AuthEntity entity;
  final String path;
  final MovieRespone? movieRespone;
  final MovieRespone? seriesRespone;
  final String? slug;
  final String? videoId;

  const LoadPushNamedRoute({
    required this.context,
    required this.entity,
    required this.path,
    this.movieRespone,
    this.seriesRespone,
    this.slug,
    this.videoId,
  });
}
