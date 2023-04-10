import 'package:flutter/material.dart';

import '../../config/enum.dart';
import '../../data/models/movie_model.dart';
// import '../../data/models/series_model.dart';
import '../entities/auth_entity.dart';

abstract class AdsRepository {
  Future<void> getAdmobInter({
    required BuildContext context,
    required AuthEntity authEntity,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
    String? videoId,
  });

  Future<void> getApplovinInter({
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
