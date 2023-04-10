import 'package:flutter/material.dart';

class ConfigSize {
  static double defaultSize = 12;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets symetric({double vertical = 0, double horizontal = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static EdgeInsets only({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) =>
      EdgeInsets.only(bottom: bottom, left: left, right: right, top: top);
}
