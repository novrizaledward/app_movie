import 'package:app_movie/src/data/sources/ads/applovin.dart';
import 'package:flutter/material.dart';

import '../../commons/navigate_handle.dart';
import '../../data/sources/ads/admob.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/ads_repository.dart';
import '../../config/enum.dart';
import '../models/movie_model.dart';
// import '../models/series_model.dart';

class AdsRepositoryImpl extends AdsRepository {
  int _clickCount = 0;
  final AdmobSource admobSource;
  final ApplovinSource applovinSource;

  AdsRepositoryImpl({required this.admobSource, required this.applovinSource});

  @override
  Future<void> getAdmobInter({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
    String? videoId,
  }) async {
    _clickCount++;

    if (_clickCount % authEntity.ad!.adInterval! == 0) {
      admobSource.loadInterstitial(
        context: context,
        authEntity: authEntity,
        typeRoute: typeRoute,
        path: path,
        movieRespone: movieRespone,
        seriesRespone: seriesRespone,
        slug: slug,
        videoId: videoId,
      );
    } else {
      NavigateHandle.byTypeRoute(
          context: context,
          typeRoute: typeRoute,
          path: path,
          movieRespone: movieRespone,
          seriesRespone: seriesRespone,
          slug: slug,
          videoId: videoId,
          authEntity: authEntity);
    }
  }

  @override
  Future<void> getApplovinInter(
      {required BuildContext context,
      required AuthEntity authEntity,
      required TypeRoute typeRoute,
      required String path,
      MovieRespone? movieRespone,
      MovieRespone? seriesRespone,
      String? slug,
      String? videoId}) async {
    _clickCount++;

    if (_clickCount % authEntity.ad!.adInterval! == 0) {
      applovinSource.loadInterstitial(
        context: context,
        authEntity: authEntity,
        typeRoute: typeRoute,
        path: path,
        movieRespone: movieRespone,
        seriesRespone: seriesRespone,
        slug: slug,
        videoId: videoId,
      );
    } else {
      NavigateHandle.byTypeRoute(
          context: context,
          typeRoute: typeRoute,
          path: path,
          movieRespone: movieRespone,
          seriesRespone: seriesRespone,
          slug: slug,
          videoId: videoId,
          authEntity: authEntity);
    }
  }
}
