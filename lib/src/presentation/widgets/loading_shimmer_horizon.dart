import 'package:app_movie/src/config/config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerHorizon extends StatelessWidget {
  const LoadingShimmerHorizon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ConfigSize.symetric(vertical: 10, horizontal: 5),
      height: 290,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: ConfigColor.subDark,
            highlightColor: ConfigColor.subDark.withOpacity(0.6),
            period: const Duration(milliseconds: 900),
            child: Container(
              width: 150,
              margin: ConfigSize.symetric(
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                color: ConfigColor.subDark,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
