import 'package:flutter/material.dart';

import '../../config/config.dart';
import 'cache_image.dart';

class PreviewItem extends StatelessWidget {
  const PreviewItem(
      {super.key, this.image, this.title, this.release, this.onTap});
  final String? image;
  final String? title;
  final String? release;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Container(
      width: 150,
      margin: ConfigSize.symetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CacheImage(
                url: image!,width: ConfigSize.width(context),
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title ?? "",
            style: theme.bodyText1,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            release ?? '',
            style: theme.bodyText2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
