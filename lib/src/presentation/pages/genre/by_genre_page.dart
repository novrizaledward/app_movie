import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/presentation/bloc/by-genre/by_genre_bloc.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../bloc/ads/ads_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../widgets/loading_shimmer_item.dart';
import '../../widgets/preview_item.dart';

class ByGenrePage extends StatefulWidget {
  final String slug;
  const ByGenrePage({super.key, required this.slug});

  @override
  State<ByGenrePage> createState() => _ByGenrePageState();
}

class _ByGenrePageState extends State<ByGenrePage> {
  final List<MovieModel> _itemByGenre = [];
  late ScrollController _scrollController;
  int _page = 1;
  int? _lastPage;
  bool _hasMore = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    context.read<ByGenreBloc>().add(LoadByGenre(genre: widget.slug, page: "1"));

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (_page == _lastPage) {
          setState(() {
            _hasMore = false;
          });
        } else {
          setState(() {
            _page++;
          });
          context
              .read<ByGenreBloc>()
              .add(LoadByGenre(genre: widget.slug, page: _page.toString()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.slug),
      ),
      body: BlocConsumer<ByGenreBloc, ByGenreState>(
        listener: (context, state) {
          if (state is ByGenreLoaded) {
            _itemByGenre.addAll(state.movieRespone.itemMovie!);
            _lastPage = state.movieRespone.meta!.lastPage;
          }
          if (state is ByGenreError) {
            _hasError = !_hasError;
          }
        },
        builder: (context, state) {
          if (state is ByGenreError) {
            return Center(
              child: Text(state.message),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 0,
              childAspectRatio: 0.6,
            ),
            itemCount: _itemByGenre.length + (_hasMore ? 2 : 0),
            padding: ConfigSize.symetric(horizontal: 5, vertical: 10),
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index < _itemByGenre.length) {
                return BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, stateAuth) {
                    if (stateAuth is AuthLoaded) {
                      return PreviewItem(
                        title: _itemByGenre[index].title,
                        image: _itemByGenre[index].image,
                        release: _itemByGenre[index].release,
                        onTap: () {
                          context.read<AdsBloc>().add(
                                LoadPushNamedRoute(
                                  context: context,
                                  entity: stateAuth.authEntity,
                                  path: ConfigRoute.detailMovie,
                                  slug: _itemByGenre[index].slug,
                                ),
                              );
                        },
                      );
                    }
                    return Container();
                  },
                );
              } else {
                if (_hasError) {
                  return Container();
                } else {
                  return _hasMore ? const LoadingShimmerItem() : Container();
                }
              }
            },
          );
        },
      ),
    );
  }
}
