import 'package:equatable/equatable.dart';

class NewReleaseEntity extends Equatable {
  final String? title;
  final String? release;
  final String? type;
  final String? slug;
  final String? image;

  const NewReleaseEntity({
    required this.title,
    required this.release,
    required this.type,
    required this.slug,
    required this.image,
  });

  @override
  List<Object?> get props => [
        title,
        release,
        type,
        slug,
        image,
      ];
}
