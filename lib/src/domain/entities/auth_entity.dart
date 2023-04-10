import 'package:equatable/equatable.dart';

import '../../data/models/auth_model.dart';
  

class AuthEntity extends Equatable {
  final bool? isOpen;
  final AdModel? ad;
  final SystemAdModel? systemAds;
  final SystemAppModel? systemApp;

  const AuthEntity(
      {required this.isOpen,
      required this.ad,
      required this.systemAds,
      required this.systemApp});

  @override
  List<Object?> get props => [isOpen, ad, systemAds, systemApp];
}
