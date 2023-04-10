import 'package:flutter/material.dart';

class IcnText extends StatelessWidget {
  final String? title;
  final IconData? icon;
  const IcnText({super.key, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon!, size: 14),
        const SizedBox(width: 3),
        Text(title ?? "", style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}
