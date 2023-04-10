import 'package:app_movie/src/domain/repositories/ads_repository.dart';
import 'package:flutter/material.dart';

import '../../config/enum.dart';
import '../../data/models/movie_model.dart';
// import '../../data/models/series_model.dart';
import '../entities/auth_entity.dart';

class AdsUsecase {
  final AdsRepository _adsRepository;

  AdsUsecase(this._adsRepository);

  Future<void> replaceAdmob({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
  }) async =>
      _adsRepository.getAdmobInter(
        context: context,
        authEntity: authEntity,
        typeRoute: typeRoute,
        path: path,
      );

  Future<void> replaceApplovin({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
  }) async =>
      _adsRepository.getApplovinInter(
        context: context,
        authEntity: authEntity,
        typeRoute: typeRoute,
        path: path,
      );

  Future<void> pushAdmob({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
    String? videoId,
  }) async =>
      _adsRepository.getAdmobInter(
        context: context,
        authEntity: authEntity,
        typeRoute: typeRoute,
        path: path,
        slug: slug,
        movieRespone: movieRespone,
        seriesRespone: seriesRespone,
        videoId: videoId,
      );

  Future<void> pushApplovin({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
    String? videoId,
  }) async =>
      _adsRepository.getApplovinInter(
        context: context,
        authEntity: authEntity,
        typeRoute: typeRoute,
        path: path,
        slug: slug,
        movieRespone: movieRespone,
        seriesRespone: seriesRespone,
        videoId: videoId,
      );
}
