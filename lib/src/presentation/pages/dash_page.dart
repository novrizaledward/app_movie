import 'package:app_movie/src/domain/entities/auth_entity.dart';
import 'package:app_movie/src/presentation/bloc/genre/genre_bloc.dart';
import 'package:app_movie/src/presentation/bloc/movie/movie_bloc.dart';
import 'package:app_movie/src/presentation/bloc/series/series_bloc.dart';
import 'package:app_movie/src/presentation/bloc/year/year_bloc.dart';
import 'package:app_movie/src/presentation/pages/by-year/by_year_page.dart';
import 'package:app_movie/src/presentation/pages/genre/genre.dart';
import 'package:app_movie/src/presentation/pages/home/home_page.dart';
import 'package:app_movie/src/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/config.dart';
import '../bloc/by-year/by_year_bloc.dart';
import '../bloc/new_release/new_release_bloc.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/custom_dialog.dart';

class DashPage extends StatefulWidget {
  final AuthEntity? authEntity;
  const DashPage({super.key, this.authEntity});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<NewReleaseBloc>().add(LoadNewRelease());
    context.read<MovieBloc>().add(const LoadMovies(page: "1"));
    context.read<SeriesBloc>().add(const LoadSeries(page: "1"));
    context.read<GenreBloc>().add(LoadGenre());
    context.read<ByYearBloc>().add(const LoadByYear("2022", "1"));
    context.read<YearBloc>().add(LoadYear());

    if (widget.authEntity!.systemAds!.status!) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await customDialog(
            context: context,
            title: widget.authEntity!.systemAds!.title!,
            content: widget.authEntity!.systemAds!.content!,
            image: widget.authEntity!.systemAds!.image!,
            url: widget.authEntity!.systemAds!.url!,
          );
        },
      );
    }
  }

  static const List<Widget> _buildScreens = [
    HomePage(),
    ByYearPage(),
    GenrePage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 55,
      backgroundColor: ConfigColor.subDark,
      selectedIndex: _selectedIndex,
      showElevation: true,
      itemCornerRadius: 12,
      curve: Curves.easeIn,
      onItemSelected: (index) {
        setState(() => _selectedIndex = index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home_max_outlined),
          title: Text('Home', style: Theme.of(context).textTheme.bodyText2!),
          activeColor: ConfigColor.subPrimary,
          inactiveColor: ConfigColor.subLight,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.calendar_view_week_rounded),
          title: Text('Year', style: Theme.of(context).textTheme.bodyText2!),
          activeColor: ConfigColor.subPrimary,
          inactiveColor: ConfigColor.subLight,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.calendar_view_day_rounded),
          title: Text('Genre', style: Theme.of(context).textTheme.bodyText2!),
          activeColor: ConfigColor.subPrimary,
          inactiveColor: ConfigColor.subLight,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.search_rounded),
          title: Text('Search', style: Theme.of(context).textTheme.bodyText2!),
          activeColor: ConfigColor.subPrimary,
          inactiveColor: ConfigColor.subLight,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
