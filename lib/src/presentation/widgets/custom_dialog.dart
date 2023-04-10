import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/config.dart';

customDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String image,
  required String url,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: ConfigColor.subDark,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        content: Text(content, style: Theme.of(context).textTheme.bodyText2),
        actions: [
          Container(
            width: ConfigSize.width(context),
            margin: ConfigSize.symetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ConfigColor.primary),
              onPressed: () {
                Uri uri = Uri.parse(url);
                _launchURL(context, uri);
              },
              child: Text(
                "Ok",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
          Container(
            width: ConfigSize.width(context),
            margin: ConfigSize.symetric(horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ConfigColor.subDark,
                  elevation: 0,
                  splashFactory: NoSplash.splashFactory),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: ConfigColor.subPrimary),
              ),
            ),
          ),
        ],
      );
    },
  );
}

_launchURL(BuildContext context, Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("URL not Found !")));
  }
}
