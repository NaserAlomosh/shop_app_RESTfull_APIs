import 'package:flutter/material.dart';

class AppWidgetSize {
  static double defaultHeight(BuildContext context, double percentage) {
    double hight = MediaQuery.of(context).size.height / percentage;
    return hight;
  }

  static double defaultWidth(BuildContext context, double percentage) {
    double width = MediaQuery.of(context).size.width / percentage;
    return width;
  }
}
