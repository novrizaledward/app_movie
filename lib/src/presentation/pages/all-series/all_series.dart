 

import 'package:app_movie/src/data/models/movie_model.dart';
// import 'package:app_movie/src/data/models/series_model.dart';
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:app_movie/src/presentation/bloc/all-series/all_series_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../widgets/loading_shimmer_item.dart';
import '../../widgets/preview_item.dart';

class AllSeries extends StatefulWidget {
  final MovieRespone? seriesRespone;
  const AllSeries({super.key, this.seriesRespone});

  @override
  State<AllSeries> createState() => _AllSeriesState();
}

class _AllSeriesState extends State<AllSeries> {
  int _page = 1;
  bool _hasMore = true;
  bool _hasError = false;
  late ScrollController _scrollController;
  final List<MovieModel> _allSeriesModel = [];

  @override
  void initState() {
    super.initState();

    _allSeriesModel.addAll(widget.seriesRespone!.itemMovie!);
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (_page == widget.seriesRespone!.meta!.lastPage) {
          setState(() {
            _hasMore = false;
          });
        } else {
          setState(() {
            _page++;
          });
          context.read<AllSeriesBloc>().add(
                LoadAllSeries(page: _page.toString()),
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todas as séries"),
        ),
        body: BlocConsumer<AllSeriesBloc, AllSeriesState>(
          listener: (context, state) {
            if (state is AllSeriesLoaded) {
              _allSeriesModel.addAll(state.seriesRespone.itemMovie!);
            }
            if (state is AllSeriesError) {
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
              itemCount: _allSeriesModel.length + (_hasMore ? 2 : 0),
              padding: ConfigSize.symetric(horizontal: 5, vertical: 10),
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                if (index < _allSeriesModel.length) {
                  return BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, stateAuth) {
                      if (stateAuth is AuthLoaded) {
                        return PreviewItem(
                          title: _allSeriesModel[index].title,
                          image: _allSeriesModel[index].image,
                          release: _allSeriesModel[index].release,
                          onTap: () {
                            context.read<AdsBloc>().add(
                                  LoadPushNamedRoute(
                                    context: context,
                                    entity: stateAuth.authEntity,
                                    path: ConfigRoute.detailMovie,
                                    slug: _allSeriesModel[index].slug,
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
        ));
  }
}
