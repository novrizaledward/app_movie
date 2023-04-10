import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

class CustomBannerApplovin extends StatefulWidget {
  final String? unitId;

  const CustomBannerApplovin({super.key, this.unitId});

  @override
  State<CustomBannerApplovin> createState() => _CustomBannerApplovinState();
}

class _CustomBannerApplovinState extends State<CustomBannerApplovin> {
  @override
  Widget build(BuildContext context) {
    return MaxAdView(
        adUnitId: widget.unitId!,
        adFormat: AdFormat.banner,
        listener: AdViewAdListener(
            onAdLoadedCallback: (ad) {},
            onAdLoadFailedCallback: (adUnitId, error) {},
            onAdClickedCallback: (ad) {},
            onAdExpandedCallback: (ad) {},
            onAdCollapsedCallback: (ad) {}));
  }
}
