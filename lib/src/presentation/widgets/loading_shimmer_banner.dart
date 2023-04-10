import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/config.dart';

class LoadingShimmerBanner extends StatelessWidget {
  const LoadingShimmerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ConfigSize.symetric(horizontal: 5),
      height: 320,
      child: Shimmer.fromColors(
        baseColor: ConfigColor.subDark,
        highlightColor: ConfigColor.subDark.withOpacity(0.6),
        period: const Duration(milliseconds: 900),
        child: Container(
          decoration: const BoxDecoration(
            color: ConfigColor.subDark,
          ),
        ),
      ),
    );
  }
}
