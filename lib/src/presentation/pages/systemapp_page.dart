import 'package:app_movie/src/presentation/widgets/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/config.dart';
import '../bloc/auth/auth_bloc.dart';

class SystemAppPage extends StatefulWidget {
  const SystemAppPage({super.key});

  @override
  State<SystemAppPage> createState() => _SystemAppPageState();
}

class _SystemAppPageState extends State<SystemAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoaded) {
            var data = state.authEntity.systemApp!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.title!,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 20),
                  CacheImage(url: data.image!),
                  const SizedBox(height: 10),
                  Container(
                      margin: ConfigSize.symetric(horizontal: 10),
                      child: Text(
                        data.content!,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.justify,
                      )),
                  const SizedBox(height: 10),
                  Container(
                    width: ConfigSize.width(context),
                    margin: ConfigSize.symetric(horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ConfigColor.primary),
                      onPressed: () {
                        Uri uri = Uri.parse(data.url!);
                        _launchURL(context, uri);
                      },
                      child: Text(
                        "Update Now !",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      )),
    );
  }

  _launchURL(BuildContext context, Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("URL not Found !")));
    }
  }
}
