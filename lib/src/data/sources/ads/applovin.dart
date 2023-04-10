// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:developer' as log;
import 'dart:math';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

import '../../../commons/navigate_handle.dart';
import '../../../config/enum.dart';
import '../../../domain/entities/auth_entity.dart';
import '../../models/movie_model.dart';

abstract class ApplovinSource {
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

class ApplovinSourceImpl extends ApplovinSource {
  static double _interstitialRetryAttempt = 0;
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
  }) async {
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        print('Interstitial ad loaded from ' + ad.networkName);
        AppLovinMAX.showInterstitial(
            authEntity.ad!.applovin!.interstitial!.adUnit!);
        print('Interstitial ad sudah di show kan from ' + ad.adUnitId);
        _interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        _interstitialRetryAttempt = _interstitialRetryAttempt + 1;

        int retryDelay = pow(2, min(6, _interstitialRetryAttempt)).toInt();

        print('Interstitial ad failed to load with code ' +
            error.code.toString() +
            ' - retrying in ' +
            retryDelay.toString() +
            's');
        NavigateHandle.byTypeRoute(
          context: context,
          typeRoute: typeRoute,
          path: path,
          movieRespone: movieRespone,
          seriesRespone: seriesRespone,
          slug: slug,
          videoId: videoId,
          authEntity: authEntity,
        );
        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial(
            authEntity.ad!.applovin!.interstitial!.adUnit!,
          );
        });
      },
      onAdDisplayedCallback: (ad) {
        print('Interstitial ad display from ' + ad.adUnitId);
        NavigateHandle.byTypeRoute(
          context: context,
          typeRoute: typeRoute,
          path: path,
          movieRespone: movieRespone,
          seriesRespone: seriesRespone,
          slug: slug,
          videoId: videoId,
          authEntity: authEntity,
        );
      },
      onAdDisplayFailedCallback: (ad, error) {
        log.log("error");
      },
      onAdClickedCallback: (ad) {},
      onAdHiddenCallback: (ad) {},
    ));

    if (authEntity.ad!.applovin!.interstitial!.adUnit!.isEmpty) {
      NavigateHandle.byTypeRoute(
        context: context,
        typeRoute: typeRoute,
        path: path,
        movieRespone: movieRespone,
        seriesRespone: seriesRespone,
        slug: slug,
        videoId: videoId,
        authEntity: authEntity,
      );
    } else {
      AppLovinMAX.loadInterstitial(
        authEntity.ad!.applovin!.interstitial!.adUnit!,
      );
    }
  }
}
