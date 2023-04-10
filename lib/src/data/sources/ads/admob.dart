import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../commons/navigate_handle.dart';
import '../../../config/enum.dart';
import '../../../domain/entities/auth_entity.dart';
import '../../models/movie_model.dart';
// import '../../models/series_model.dart';

abstract class AdmobSource {
  void loadInterstitial({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
    String? videoId,
  });
}

class AdmobSourceImpl extends AdmobSource {
  NativeAd? nativeAd;

  @override
  void loadInterstitial({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
    String? videoId,
  }) =>
      InterstitialAd.load(
        adUnitId: authEntity.ad!.admob!.interstitial!.adUnit!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdFailedToLoad: (LoadAdError error) => NavigateHandle.byTypeRoute(
            context: context,
            typeRoute: typeRoute,
            path: path,
            movieRespone: movieRespone,
            seriesRespone: seriesRespone,
            slug: slug,
            videoId: videoId,
            authEntity: authEntity,
          ),
          onAdLoaded: (InterstitialAd ad) {
            ad.show();
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) => ad.dispose(),
              onAdFailedToShowFullScreenContent: (ad, error) => ad.dispose(),
              onAdShowedFullScreenContent: (ad) => NavigateHandle.byTypeRoute(
                context: context,
                typeRoute: typeRoute,
                path: path,
                movieRespone: movieRespone,
                seriesRespone: seriesRespone,
                slug: slug,
                videoId: videoId,
                authEntity: authEntity,
              ),
            );
          },
        ),
      );
}
