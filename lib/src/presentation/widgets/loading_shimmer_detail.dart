import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/config.dart';

class LoadingShimmerDetail extends StatelessWidget {
  const LoadingShimmerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ConfigColor.subDark,
        highlightColor: ConfigColor.subDark.withOpacity(0.6),
        period: const Duration(milliseconds: 900),
        child: ListView(
          children: [
            Container(
              width: ConfigSize.width(context),
              height: 250,
              color: ConfigColor.dark,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: ConfigSize.width(context),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: ConfigSize.width(context),
                    height: 10,
                    color: ConfigColor.dark,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: ConfigSize.width(context),
                    height: 30,
                    color: ConfigColor.dark,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: ConfigSize.width(context),
              height: 50,
              color: ConfigColor.dark,
            ),
            const SizedBox(height: 10),
            Container(
              width: ConfigSize.width(context),
              height: 200,
              color: ConfigColor.dark,
            ),
          ],
        ));
  }
}
