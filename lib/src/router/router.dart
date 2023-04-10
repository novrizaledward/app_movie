import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/domain/entities/screen_argument.dart';
import 'package:app_movie/src/presentation/pages/all-movie/all_movie.dart';
import 'package:app_movie/src/presentation/pages/all-release/all_release.dart';
import 'package:app_movie/src/presentation/pages/all-series/all_series.dart';
import 'package:app_movie/src/presentation/pages/auth/auth_page.dart';
import 'package:app_movie/src/presentation/pages/by-year/by_year_all_page.dart';
import 'package:app_movie/src/presentation/pages/dash_page.dart';
import 'package:app_movie/src/presentation/pages/detail/movie_detail.dart';
import 'package:app_movie/src/presentation/pages/genre/by_genre_page.dart';
import 'package:app_movie/src/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/blank/blank_page.dart';
import '../presentation/pages/detail/eps_detail.dart';
import '../presentation/pages/player/player_page.dart';
import '../presentation/pages/systemapp_page.dart';

class RouterGenerate {
  static Route<dynamic> build(RouteSettings settings) {
    switch (settings.name) {
      case ConfigRoute.blank:
        return MaterialPageRoute(builder: (_) => const BlankPage());
      case ConfigRoute.systemApp:
        return MaterialPageRoute(builder: (_) => const SystemAppPage());
      case ConfigRoute.auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case ConfigRoute.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case ConfigRoute.dash:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
            builder: (_) => DashPage(authEntity: arg.authEntity));
      case ConfigRoute.allRelease:
        return MaterialPageRoute(builder: (_) => const AllRelease());
      case ConfigRoute.allMovie:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
          builder: (_) => AllMovie(movieRespone: arg.movieRespone),
        );
      case ConfigRoute.allSeries:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
          builder: (_) => AllSeries(seriesRespone: arg.seriesRespone),
        );
      case ConfigRoute.detailMovie:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
          builder: (_) => MovieDetailPage(slug: arg.slug),
        );
      case ConfigRoute.player:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
          builder: (_) => PlayerPage(videoId: arg.videoId!),
        );
      case ConfigRoute.detailEps:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
          builder: (_) => EpsDetail(slug: arg.slug!),
        );
      case ConfigRoute.byYearAll:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
          builder: (_) => ByYearAllPage(movieRespone: arg.movieRespone!),
        );
      case ConfigRoute.byGenre:
        var arg = settings.arguments as ScreenArgument;
        return MaterialPageRoute(
          builder: (_) => ByGenrePage(slug: arg.slug!),
        );
      default:
        return MaterialPageRoute(builder: (_) => const BlankPage());
    }
  }
}
