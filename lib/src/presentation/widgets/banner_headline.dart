import 'package:flutter/material.dart';

import '../../config/config.dart';
import 'cache_image.dart';

class BannerHeadline extends StatelessWidget {
  final String? image;
  final String? title;
  final String? type;
  final String? release;
  final VoidCallback onTap;
  const BannerHeadline(
      {super.key, this.image, this.title, this.type, this.release, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CacheImage(
          url: image!,
          width: ConfigSize.width(context),
          height: 320,
          fit: BoxFit.cover,
        ),
        Container(
          width: ConfigSize.width(context),
          height: 320,
          decoration: BoxDecoration(
            color: ConfigColor.dark,
            gradient: LinearGradient(
                colors: [
                  ConfigColor.dark,
                  ConfigColor.dark.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.1, 0.7]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title!,
                style: Theme.of(context).textTheme.headline2,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ConfigColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: ConfigSize.symetric(
                    horizontal: 40,
                    vertical: 0,
                  ),
                ),
                child: Text(
                  "Play",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    type!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    release!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
