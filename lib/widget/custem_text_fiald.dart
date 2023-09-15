import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';
import 'package:phone_taolet_desktop/classes/widget_size.dart';

// ignore: must_be_immutable
class CustemTextFiald extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  bool obscureText;

  TextInputType textInputType;

  final IconData icon;

  CustemTextFiald({
    super.key,
    required this.lable,
    required this.icon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppWidgetSize.defaultWidth(context, 8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppWidgetSize.defaultHeight(context, 5),
        ),
        child: Container(
          height: AppWidgetSize.defaultHeight(context, 16),
          color: ColorManger.white.withOpacity(0.5),
          child: Center(
            child: TextField(
              controller: controller,
              keyboardType: textInputType,
              obscureText: obscureText,
              decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(icon),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: lable,
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
