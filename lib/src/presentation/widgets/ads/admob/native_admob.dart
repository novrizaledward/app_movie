import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomNativeAdmob extends StatefulWidget {
  final String unitId;
  const CustomNativeAdmob({super.key, required this.unitId});

  @override
  State<CustomNativeAdmob> createState() => _CustomNativeAdmobState();
}

class _CustomNativeAdmobState extends State<CustomNativeAdmob> {
  NativeAd? nativeAd;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    showNativeAd(widget.unitId);
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded ? AdWidget(ad: nativeAd!) : Container();
  }

  showNativeAd(String unitIdNative) {
    nativeAd = NativeAd(
      adUnitId: unitIdNative,
      factoryId: 'listTile',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            nativeAd = ad as NativeAd;
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    nativeAd!.load();
  }
}
