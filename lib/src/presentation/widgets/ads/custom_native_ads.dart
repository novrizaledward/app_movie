import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../bloc/auth/auth_bloc.dart';
import 'admob/native_admob.dart';

class CustonNativeAds extends StatefulWidget {
  const CustonNativeAds({super.key});

  @override
  State<CustonNativeAds> createState() => _CustonNativeAdsState();
}

class _CustonNativeAdsState extends State<CustonNativeAds> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoaded) {
          if (state.authEntity.ad!.adActive == "admob" &&
              state.authEntity.ad!.admob!.nativeId!.status!) {
            return Container(
              color: ConfigColor.light,
              height: 70,
              margin: ConfigSize.symetric(vertical: 5),
              width: ConfigSize.width(context),
              child: CustomNativeAdmob(
                unitId: state.authEntity.ad!.admob!.nativeId!.adUnit!,
              ),
            );
          } else if (state.authEntity.ad!.adActive == "fan" &&
              state.authEntity.ad!.fan!.nativeId!.status!) {
          } else if (state.authEntity.ad!.adActive == "applovin" &&
              state.authEntity.ad!.applovin!.nativeId!.status!) {
          } else {
            return Container();
          }
        }
        return Container();
      },
    );
  }
}
