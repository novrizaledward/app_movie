import 'dart:developer';

import 'package:app_movie/src/config/enum.dart';
import 'package:app_movie/src/data/models/movie_model.dart';
// import 'package:app_movie/src/data/models/series_model.dart';
import 'package:app_movie/src/domain/entities/auth_entity.dart';
import 'package:app_movie/src/domain/usecases/ads_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsUsecase _adsUsecase;
  AdsBloc(this._adsUsecase) : super(AdsInitial()) {
    on<LoadPushReplaceNamedRoute>((event, emit) async {
      if (event.entity.ad!.adActive == "admob") {
        await _adsUsecase.replaceAdmob(
          context: event.context,
          authEntity: event.entity,
          typeRoute: TypeRoute.replace,
          path: event.path,
        );
      } else if (event.entity.ad!.adActive == "fan") {
        log("Acvtived 'FAN' , pasang controller fan repository terlebih dahulu");
      } else if (event.entity.ad!.adActive == "applovin") {
        await _adsUsecase.replaceApplovin(
          context: event.context,
          authEntity: event.entity,
          typeRoute: TypeRoute.replace,
          path: event.path,
        );
      } else {
        Navigator.pushReplacementNamed(event.context, event.path);
      }
    });
    on<LoadPushNamedRoute>((event, emit) async {
      if (event.entity.ad!.adActive == "admob") {
        await _adsUsecase.pushAdmob(
          context: event.context,
          authEntity: event.entity,
          typeRoute: TypeRoute.push,
          path: event.path,
          slug: event.slug,
          movieRespone: event.movieRespone,
          seriesRespone: event.seriesRespone,
          videoId: event.videoId,
        );
      } else if (event.entity.ad!.adActive == "fan") {
        // log("Acvtived 'FAN' , pasang controller fan repository terlebih dahulu");
        //  ....
      } else if (event.entity.ad!.adActive == "applovin") {
        await _adsUsecase.pushApplovin(
          context: event.context,
          authEntity: event.entity,
          typeRoute: TypeRoute.push,
          path: event.path,
          slug: event.slug,
          movieRespone: event.movieRespone,
          seriesRespone: event.seriesRespone,
          videoId: event.videoId,
        );
      } else {
        Navigator.pushReplacementNamed(event.context, event.path);
      }
    });
    on<LoadPopRoute>((event, emit) async {
      Navigator.pop(event.context);
    });
  }
}
