import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../bloc/all-movie/all_movie_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../widgets/loading_shimmer_item.dart';
import '../../widgets/preview_item.dart';

class AllMovie extends StatefulWidget {
  final MovieRespone? movieRespone;

  const AllMovie({super.key, this.movieRespone});

  @override
  State<AllMovie> createState() => _AllMovieState();
}

class _AllMovieState extends State<AllMovie> {
  int _page = 1;
  bool _hasMore = true;
  bool _hasError = false;
  late ScrollController _scrollController;
  late AllMovieBloc _bloc;
  final List<MovieModel> _allMovieNew = [];

  @override
  void initState() {
    super.initState();
    _allMovieNew.addAll(widget.movieRespone!.itemMovie!);
    _bloc = BlocProvider.of<AllMovieBloc>(context);
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (_page == widget.movieRespone!.meta!.lastPage) {
          setState(() {
            _hasMore = false;
          });
        } else {
          setState(() {
            _page++;
          });
          _bloc.add(LoadAllMovies(page: _page.toString()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos os filmes"),
      ),
      body: BlocConsumer<AllMovieBloc, AllMovieState>(
        listener: (context, state) {
          if (state is MoviesAllLoaded) {
            _allMovieNew.addAll(state.movieItem.itemMovie!);
          }
          if (state is MovieAllError) {
            _hasError = !_hasError;
          }
        },
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 0,
              childAspectRatio: 0.6,
            ),
            itemCount: _allMovieNew.length + (_hasMore ? 2 : 0),
            padding: ConfigSize.symetric(horizontal: 5, vertical: 10),
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index < _allMovieNew.length) {
                return BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, stateAuth) {
                    if (stateAuth is AuthLoaded) {
                      return PreviewItem(
                        title: _allMovieNew[index].title,
                        image: _allMovieNew[index].image,
                        release: _allMovieNew[index].release,
                        onTap: () {
                          context.read<AdsBloc>().add(LoadPushNamedRoute(
                                context: context,
                                entity: stateAuth.authEntity,
                                path: ConfigRoute.detailMovie,
                                slug: _allMovieNew[index].slug,
                              ));
                        },
                      );
                    }
                    return Container();
                  },
                );
                // return Text(index.toString());
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
