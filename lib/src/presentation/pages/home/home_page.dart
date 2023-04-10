import 'package:app_movie/src/presentation/pages/home/components/new_releases.dart'; 
import 'package:flutter/material.dart'; 
import '../../widgets/ads/custom_native_ads.dart';
import 'components/banner.dart';
import 'components/movie_list.dart';
import 'components/series_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool systemAds = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            bannerHome(),
            const SizedBox(height: 20),
            const CustonNativeAds(),
            const SizedBox(height: 20),
            newReleases(),
            const SizedBox(height: 20),
            movieList(),
            const SizedBox(height: 20),
            seriesList(),
          ],
        ),
      ),
    );
  }
}
