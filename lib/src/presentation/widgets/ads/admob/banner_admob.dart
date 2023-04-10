import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomBannerAdmob extends StatefulWidget {
  final String unitId;
  final AdSize? adSize;

  const CustomBannerAdmob({super.key, required this.unitId, this.adSize});

  @override
  State<CustomBannerAdmob> createState() => _CustomBannerAdmobState();
}

class _CustomBannerAdmobState extends State<CustomBannerAdmob> {
  BannerAd? _bannerAd;
  bool isBannerAdReady = false;
  @override
  void initState() {
    super.initState();
    showBannerAdmob();
  }

  @override
  Widget build(BuildContext context) {
    return AdWidget(
      ad: _bannerAd!,
    );
  }

  showBannerAdmob() {
    _bannerAd = BannerAd(
      adUnitId: widget.unitId,
      request: const AdRequest(),
      size: widget.adSize!,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdReady = true;
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          isBannerAdReady = false;
          ad.dispose();
        },
      ),
    )..load();
  }
}
