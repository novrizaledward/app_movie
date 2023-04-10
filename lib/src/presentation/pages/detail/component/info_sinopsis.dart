 
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../config/config.dart';

Widget infoSinopsis(BuildContext context, String sinopsis) {
  return Container(
    margin: ConfigSize.symetric(horizontal: 15, vertical: 5),
    child: ReadMoreText(
      sinopsis,
      style: Theme.of(context).textTheme.bodyText2,
      textAlign: TextAlign.justify,
      colorClickableText: ConfigColor.subPrimary,
      trimMode: TrimMode.Line,
      trimLines: 3,
    ),
  );
}
