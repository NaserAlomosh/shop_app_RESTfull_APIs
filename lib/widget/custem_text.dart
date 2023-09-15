// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_taolet_desktop/classes/font_weight.dart';

class CustemText extends StatelessWidget {
  final String text;
  final double fontsize;

  final Color color;

  FontWeight fontWeight;

  CustemText({
    super.key,
    required this.text,
    required this.fontsize,
    required this.color,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontsize.sp,
        color: color,
        fontFamily: AppFontFamily.fontFamily,
      ),
    );
  }
}
