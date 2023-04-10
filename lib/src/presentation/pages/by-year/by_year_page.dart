import 'package:app_movie/src/presentation/pages/by-year/components/banner.dart';
import 'package:app_movie/src/presentation/pages/by-year/components/grid_item.dart';
import 'package:flutter/material.dart';
import '../../widgets/ads/custom_native_ads.dart'; 
import 'components/menu_year_drop.dart';

class ByYearPage extends StatefulWidget {
  const ByYearPage({super.key});

  @override
  State<ByYearPage> createState() => _ByYearPageState();
}

class _ByYearPageState extends State<ByYearPage> {
  bool _isScroll = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 300) {
        setState(() {
          _isScroll = true;
        });
      } else {
        setState(() {
          _isScroll = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: _isScroll ? null : Colors.transparent,
        elevation: 0,
        actions: const [MenuYearDrop()],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            bannerYear(),
            const SizedBox(height: 20),
            const CustonNativeAds(),
            const SizedBox(height: 20),
            gridItemYear(),
          ],
        ),
      ),
    );
  }
}
