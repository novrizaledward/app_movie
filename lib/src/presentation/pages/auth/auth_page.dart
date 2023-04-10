import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/ads/ads_bloc.dart';
import '../../widgets/loading_circle.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(LoadAuth());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          if (state.authEntity.systemApp!.status!) {
            context.read<AdsBloc>().add(LoadPushReplaceNamedRoute(
                  context,
                  state.authEntity,
                  ConfigRoute.systemApp,
                ));
          } else {
            context.read<AdsBloc>().add(LoadPushReplaceNamedRoute(
                  context,
                  state.authEntity,
                  ConfigRoute.dash,
                ));
          }
        }
      },
      builder: (context, state) {
        if (state is AuthWaiting) {
          return const LoadingCircle();
        }
        return Container();
      },
    ));
  }
}
