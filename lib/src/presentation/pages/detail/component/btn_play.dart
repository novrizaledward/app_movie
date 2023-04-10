
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../bloc/auth/auth_bloc.dart';

Widget btnPlay(BuildContext context, String videoId) {
  TextTheme theme = Theme.of(context).textTheme;
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, stateAuth) {
      if (stateAuth is AuthLoaded) {
        return Container(
          width: ConfigSize.width(context),
          margin: ConfigSize.symetric(horizontal: 15, vertical: 5),
          child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ConfigColor.primary),
            onPressed: () {},
            child: Text(
              "Play",
              style: theme.bodyText1,
            ),
          ),
        );
      }
      return Container();
    },
  );
}
