import 'package:flutter/material.dart';

import '../../config/config.dart';

class LabelItem extends StatelessWidget {
  const LabelItem({super.key, this.onTap, this.title});
  final VoidCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: theme.headline4,
        ),
        InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.arrow_forward,
            color: ConfigColor.subPrimary,
          ),
        ),
      ],
    );
  }
}
