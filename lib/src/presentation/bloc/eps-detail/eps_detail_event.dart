part of 'eps_detail_bloc.dart';

abstract class EpsDetailEvent extends Equatable {
  const EpsDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadEpsDetail extends EpsDetailEvent {
  final String slug;

  const LoadEpsDetail(this.slug);
}
