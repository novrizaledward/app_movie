import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/presentation/bloc/all-series/all_series_bloc.dart';
import 'package:app_movie/src/presentation/bloc/by-genre/by_genre_bloc.dart';
import 'package:app_movie/src/presentation/bloc/by-year-all/by_year_all_bloc.dart';
import 'package:app_movie/src/presentation/bloc/by-year/by_year_bloc.dart';
import 'package:app_movie/src/presentation/bloc/genre/genre_bloc.dart';
import 'package:app_movie/src/presentation/bloc/series/series_bloc.dart';
import 'package:app_movie/src/presentation/bloc/video/video_bloc.dart';
import 'package:app_movie/src/presentation/bloc/year/year_bloc.dart';
import 'package:app_movie/src/config/theme.dart';
import 'package:app_movie/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:app_movie/src/router/router.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import './injection.dart' as di;
import 'firebase_options.dart';
import 'src/presentation/bloc/all-movie/all_movie_bloc.dart';
import 'src/presentation/bloc/ads/ads_bloc.dart';
import 'src/presentation/bloc/eps-detail/eps_detail_bloc.dart';
import 'src/presentation/bloc/movie-detail/movie_detail_bloc.dart';
import 'src/presentation/bloc/movie/movie_bloc.dart';
import 'src/presentation/bloc/new_release/new_release_bloc.dart';
import 'src/presentation/bloc/search/search_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  OneSignal.shared.setAppId("5101f7e5-279c-4647-baf1-1d189f9ab76f");
  await AppLovinMAX.initialize(
      "exEMohPo0fCzgZa-ZZHXUpyhz4OSztd5EonoyRahwwB_CF255nlBtb5wyad0o3-ebFq2cNbuIR3EkkHymNvF0Q");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdsBloc>(create: (_) => di.locator<AdsBloc>()),
        BlocProvider<AuthBloc>(create: (_) => di.locator<AuthBloc>()),
        BlocProvider<NewReleaseBloc>(
          create: (_) => di.locator<NewReleaseBloc>(),
        ),
        BlocProvider<MovieDetailBloc>(
            create: (_) => di.locator<MovieDetailBloc>()),
        BlocProvider<MovieBloc>(create: (_) => di.locator<MovieBloc>()),
        BlocProvider<SeriesBloc>(create: (_) => di.locator<SeriesBloc>()),
        BlocProvider<AllMovieBloc>(create: (_) => di.locator<AllMovieBloc>()),
        BlocProvider<AllSeriesBloc>(create: (_) => di.locator<AllSeriesBloc>()),
        BlocProvider<GenreBloc>(create: (_) => di.locator<GenreBloc>()),
        BlocProvider<SearchBloc>(create: (_) => di.locator<SearchBloc>()),
        BlocProvider<ByYearBloc>(create: (_) => di.locator<ByYearBloc>()),
        BlocProvider<ByYearAllBloc>(create: (_) => di.locator<ByYearAllBloc>()),
        BlocProvider<YearBloc>(create: (_) => di.locator<YearBloc>()),
        BlocProvider<VideoBloc>(create: (_) => di.locator<VideoBloc>()),
        BlocProvider<EpsDetailBloc>(create: (_) => di.locator<EpsDetailBloc>()),
        BlocProvider<ByGenreBloc>(create: (_) => di.locator<ByGenreBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Megaflix",
        theme: AppTheme.dark,
        initialRoute: ConfigRoute.auth,
        onGenerateRoute: (settings) => RouterGenerate.build(settings),
      ),
    );
  }
}
