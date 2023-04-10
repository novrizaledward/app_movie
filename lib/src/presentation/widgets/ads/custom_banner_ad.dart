import 'package:app_movie/src/presentation/widgets/ads/admob/banner_admob.dart';
import 'package:app_movie/src/presentation/widgets/ads/applovin/banner_applovin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../config/config.dart';
import '../../bloc/auth/auth_bloc.dart';

class CustomBannerAd extends StatelessWidget {
  const CustomBannerAd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoaded) {
          if (state.authEntity.ad!.adActive == "admob" &&
              state.authEntity.ad!.admob!.banner!.status!) {
            return Container(
                height: 70,
                margin: ConfigSize.symetric(vertical: 5),
                width: ConfigSize.width(context),
                child: CustomBannerAdmob(
                  unitId: state.authEntity.ad!.admob!.banner!.adUnit!,
                  adSize: AdSize.fullBanner,
                ));
          } else if (state.authEntity.ad!.adActive == "fan" &&
              state.authEntity.ad!.fan!.banner!.status!) {
          } else if (state.authEntity.ad!.adActive == "applovin" &&
              state.authEntity.ad!.applovin!.banner!.status!) {
            return Container(
              height: 50,
              margin: ConfigSize.symetric(vertical: 10),
              width: ConfigSize.width(context),
              child: CustomBannerApplovin(
                unitId: state.authEntity.ad!.applovin!.banner!.adUnit,
              ),
            );
          } else {
            return Container();
          }
        }
        return Container();
      },
    );
  }
}
