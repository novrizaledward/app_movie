import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:app_movie/src/presentation/bloc/movie-detail/movie_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../../data/models/related_post_model.dart';
import '../../../../data/models/season_info_model.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../widgets/cache_image.dart';

Widget tabTitle(BuildContext context, TabController controller) {
  return Container(
    margin: ConfigSize.symetric(vertical: 15),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: ConfigColor.subDark,
          width: 1.0,
        ),
      ),
    ),
    child: TabBar(
        controller: controller,
        indicatorColor: ConfigColor.subPrimary,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: ConfigColor.subLight.withOpacity(0.3),
        labelColor: ConfigColor.light,
        padding: EdgeInsets.zero,
        splashBorderRadius: BorderRadius.circular(12),
        splashFactory: NoSplash.splashFactory,
        labelStyle: Theme.of(context).textTheme.headline4,
        labelPadding: ConfigSize.symetric(horizontal: 15),
        indicatorPadding: EdgeInsets.zero,
        isScrollable: true,
        tabs: const [
          Tab(
            text: "Temporada",
          ),
          Tab(
            text: "Títulos Semelhantes",
          ),
        ]),
  );
}

Widget tabSeason(BuildContext context, TabController controller,
    List<SeasonModel> season, List<RelatedPostModel> relatedPost) {
  return SizedBox(
    height: ConfigSize.height(context),
    child: TabBarView(
      controller: controller,
      children: [
        Container(
          margin: ConfigSize.symetric(
            horizontal: 10,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: season.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionTile(
                title: Text(
                  season[index].name!,
                ),
                childrenPadding: ConfigSize.symetric(horizontal: 10),
                children: season[index]
                    .seasonVideo!
                    .map((e) => itemTile(
                          context: context,
                          eps: e.episode,
                          title: e.title,
                          image: e.image,
                          release: e.release,
                          slug: e.slug,
                        ))
                    .toList(),
              );
            },
          ),
        ),
        Container(
          margin: ConfigSize.symetric(horizontal: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7),
            itemCount: relatedPost.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  context
                      .read<MovieDetailBloc>()
                      .add(LoadMovieDetail(slug: relatedPost[index].path!));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CacheImage(
                    url: relatedPost[index].url!,
                    width: ConfigSize.width(context),
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget itemTile({
  BuildContext? context,
  String? image,
  String? title,
  String? eps,
  String? release,
  String? slug,
}) {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      if (state is AuthLoaded) {
        return InkWell(
          onTap: () {
            if (state.authEntity.isOpen!) {
              context.read<AdsBloc>().add(LoadPushNamedRoute(
                    context: context,
                    entity: state.authEntity,
                    path: ConfigRoute.detailEps,
                    slug: slug,
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "The purpose of this app is to show information only.",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                backgroundColor: ConfigColor.subDark,
                duration: const Duration(milliseconds: 500),
              ));
            }
          },
          child: Container(
            padding: ConfigSize.symetric(vertical: 10),
            child: Row(
              children: [
                CacheImage(url: image!, width: 100),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eps!,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        release!,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
      return Container();
    },
  );
}
