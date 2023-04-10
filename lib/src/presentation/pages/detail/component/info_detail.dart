import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../widgets/icon_text.dart';

Widget infoDetail(
  BuildContext context,
  String country,
  String duration,
  String rating,
  String title,
  String release,
  List<String> genre,
  bool isMovie,
) {
  return Container(
    margin: ConfigSize.symetric(horizontal: 15, vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMovie
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IcnText(
                    icon: Icons.flag,
                    title: country,
                  ),
                  const SizedBox(width: 20),
                  IcnText(
                    icon: Icons.timelapse,
                    title: duration,
                  ),
                  const SizedBox(width: 20),
                  IcnText(
                    icon: Icons.star,
                    title: rating,
                  ),
                ],
              )
            : Container(),
        const SizedBox(height: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Wrap(
            spacing: 5,
            children: genre
                .map((e) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.circle,
                            size: 10, color: ConfigColor.subLight),
                        const SizedBox(width: 3),
                        Text(e, style: Theme.of(context).textTheme.subtitle2),
                      ],
                    ))
                .toList()),
        const SizedBox(height: 10),
        Text(release, style: Theme.of(context).textTheme.subtitle2),
      ],
    ),
  );
}
