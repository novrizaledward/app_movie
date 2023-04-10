import 'package:equatable/equatable.dart';

class RelatedPostEntity extends Equatable {
  final String? path;
  final String? url;

  const RelatedPostEntity({
    required this.path,
    required this.url,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
