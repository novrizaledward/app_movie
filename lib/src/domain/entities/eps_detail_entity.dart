import 'package:app_movie/src/domain/entities/info_eps_entity.dart';
import 'package:equatable/equatable.dart';

class EpsDetailEntity extends Equatable {
  final InfoEpsEntity info;

  const EpsDetailEntity({required this.info});

  @override 
  List<Object?> get props => [info];
}
