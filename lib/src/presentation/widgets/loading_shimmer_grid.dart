import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/config.dart';

class LoadingShimmerGrid extends StatelessWidget {
  final bool? shrinkwrap;
  final int? count;
  const LoadingShimmerGrid({super.key, this.shrinkwrap, this.count});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 0,
        childAspectRatio: 0.6,
      ),
      shrinkWrap: shrinkwrap!,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      padding: ConfigSize.symetric(horizontal: 5, vertical: 10),
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
    );
  }
}
