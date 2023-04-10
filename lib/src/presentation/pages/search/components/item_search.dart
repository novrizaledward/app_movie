import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/presentation/widgets/cache_image.dart';
import 'package:flutter/material.dart';

class ItemSearch extends StatelessWidget {
  final String? rating;
  final String? title;
  final String? release;
  final String? sinopsis;
  final String? image;
  final VoidCallback onTap;
  const ItemSearch(
      {super.key,
      this.rating,
      this.title,
      this.release,
      this.sinopsis,
      this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: ConfigSize.symetric(vertical: 5, horizontal: 10),
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ConfigSize.defaultSize),
              child: CacheImage(
                url: image!,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        release!,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(width: 15),
                      Container(
                          padding:
                              ConfigSize.symetric(vertical: 3, horizontal: 10),
                          decoration: BoxDecoration(
                              color: ConfigColor.primary,
                              borderRadius: BorderRadius.circular(
                                  ConfigSize.defaultSize)),
                          child: Text(
                            rating == "" ? "0" : rating!,
                            style: Theme.of(context).textTheme.subtitle2,
                          )),
                    ],
                  ),
                  Text(
                    sinopsis!,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
