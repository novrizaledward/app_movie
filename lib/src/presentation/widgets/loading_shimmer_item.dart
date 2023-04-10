import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/config.dart';

class LoadingShimmerItem extends StatelessWidget {
  const LoadingShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
