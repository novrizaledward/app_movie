import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/presentation/bloc/by-year-all/by_year_all_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../bloc/ads/ads_bloc.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../widgets/loading_shimmer_item.dart';
import '../../widgets/preview_item.dart';

class ByYearAllPage extends StatefulWidget {
  final MovieRespone movieRespone;
  const ByYearAllPage({super.key, required this.movieRespone});

  @override
  State<ByYearAllPage> createState() => _ByYearAllPageState();
}

class _ByYearAllPageState extends State<ByYearAllPage> {
  late ScrollController _scrollController;
  final List<MovieModel> _itemByyear = [];
  int _page = 1;
  bool _hasMore = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _itemByyear.addAll(widget.movieRespone.itemMovie!);

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (_page == widget.movieRespone.meta!.lastPage) {
          setState(() {
            _hasMore = false;
          });
        } else {
          setState(() {
            _page++;
          });
          context.read<ByYearAllBloc>().add(
                LoadByYearAll(
                  widget.movieRespone.itemMovie![0].release!,
                  _page.toString(),
                ),
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_itemByyear[0].release!),
      ),
      body: BlocConsumer<ByYearAllBloc, ByYearAllState>(
        listener: (context, state) {
          if (state is ByYearLoadedAll) {
            _itemByyear.addAll(state.movieRespone.itemMovie!);
          }
          if (state is ByYearAllError) {
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
            itemCount: _itemByyear.length + (_hasMore ? 2 : 0),
            padding: ConfigSize.symetric(horizontal: 5, vertical: 10),
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index < _itemByyear.length) {
                return BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, stateAuth) {
                    if (stateAuth is AuthLoaded) {
                      return PreviewItem(
                        title: _itemByyear[index].title,
                        image: _itemByyear[index].image,
                        release: _itemByyear[index].release,
                        onTap: () {
                          context.read<AdsBloc>().add(
                                LoadPushNamedRoute(
                                  context: context,
                                  entity: stateAuth.authEntity,
                                  path: ConfigRoute.detailMovie,
                                  slug: _itemByyear[index].slug,
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
