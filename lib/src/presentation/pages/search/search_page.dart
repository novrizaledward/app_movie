import 'dart:developer';

import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/data/models/search_model.dart';
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:app_movie/src/presentation/bloc/search/search_bloc.dart';
import 'package:app_movie/src/presentation/pages/search/components/item_search.dart';
import 'package:app_movie/src/presentation/widgets/loading_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../widgets/ads/custom_native_ads.dart'; 

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _page = 1;
  int _lastpage = 1;
  bool isTyping = false;
  bool _isWaiting = false;
  bool _hasMore = false;
  bool _hasError = false;
  bool _notFound = false;
  late int lastPage;
  late ScrollController _scrollController;
  final List<SearchModel> newSearchItem = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (_page == _lastpage) {
          setState(() {
            _hasMore = false;
          });
        } else {
          log("jalan");
          setState(() {
            _hasMore = true;
            _page++;
          });
          context.read<SearchBloc>().add(
                LoadSearch(
                  keyword: _controller.text,
                  page: _page.toString(),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Container(
          height: 35,
          margin: ConfigSize.only(left: 15, right: 10),
          child: TextField(
            cursorColor: ConfigColor.primary,
            controller: _controller,
            style: Theme.of(context).textTheme.subtitle1,
            decoration: InputDecoration(
              isDense: true,
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: ConfigColor.subLight),
              fillColor: ConfigColor.subDark,
              filled: true,
              hintText: 'Filmes e Séries',
              prefixIcon: const Icon(Icons.search_rounded),
              prefixIconColor: ConfigColor.subLight,
              suffixIconConstraints: const BoxConstraints(
                minHeight: 2,
                minWidth: 2,
              ),
              suffixIcon: isTyping
                  ? InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          _controller.clear();
                          isTyping = false;
                        });
                      },
                      child: Padding(
                        padding: ConfigSize.only(right: 10, left: 0),
                        child: const Icon(Icons.close,
                            color: ConfigColor.subLight),
                      ),
                    )
                  : const SizedBox(),
              contentPadding:
                  ConfigSize.only(bottom: 10, left: 15, right: 0, top: 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            onSubmitted: (v) {
              if (v.isEmpty) {
                log("kosong");
              } else {
                setState(() {
                  _isWaiting = true;
                  newSearchItem.clear();
                });

                context.read<SearchBloc>().add(
                      LoadSearch(keyword: v, page: "1"),
                    );
              }
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  isTyping = true;
                });
              }
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_controller.text.isEmpty) {
                log("kosong");
              } else {
                setState(() {
                  _isWaiting = true;
                  newSearchItem.clear();
                });
                context.read<SearchBloc>().add(
                      LoadSearch(keyword: _controller.text, page: "1"),
                    );
              }
            },
            child: const Text("Pesquisar"),
          )
        ],
      ),
      body: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchLoaded) {
            setState(() {
              _isWaiting = false;
              _lastpage = state.searchRespone.meta!.lastPage!;
            });
            if (state.searchRespone.itemSearch!.isEmpty) {
              setState(() {
                _notFound = true;
              });
            } else {
              setState(() {
                _notFound = false;
              });
              newSearchItem.addAll(state.searchRespone.itemSearch!);
            }
          }
          if (state is SearchError) {
            setState(() {
              _hasError = true;
              _hasMore = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sem mais carga..."),
                backgroundColor: ConfigColor.subLight,
                duration: Duration(milliseconds: 500),
              ),
            );
          }
        },
        child: body(context),
      ),
    );
  }

  Widget body(BuildContext context) {
    if (_isWaiting) {
      return const LoadingCircle();
    } else if (_notFound) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              size: 40,
              color: ConfigColor.subLight,
            ),
            const SizedBox(height: 5),
            Text(
              "Palavra-chave não encontrada !",
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    } else {
      return ListView.separated(
        separatorBuilder: (context, index) {
          if (index % 15 == 0) {
            return const CustonNativeAds();
          } else {
            return Container();
          }
        },
        controller: _scrollController,
        itemCount: newSearchItem.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index != newSearchItem.length) {
            var data = newSearchItem[index];
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, stateAuth) {
                if (stateAuth is AuthLoaded) {
                  return ItemSearch(
                    rating: data.rating,
                    title: data.title,
                    release: data.release,
                    sinopsis: data.sinopsis,
                    image: data.image,
                    onTap: () {
                      context.read<AdsBloc>().add(LoadPushNamedRoute(
                            context: context,
                            entity: stateAuth.authEntity,
                            path: ConfigRoute.detailMovie,
                            slug: data.slug,
                          ));
                    },
                  );
                }
                return Container();
              },
            );
          } else {
            if (_hasMore) {
              return Padding(
                padding: ConfigSize.symetric(vertical: 10),
                child: const LoadingCircle(),
              );
            } else {
              if (_hasError) {
                return Container();
              } else {
                return Container();
              }
            }
          }
        },
      );
    }
  }
}
