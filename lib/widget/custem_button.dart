import 'package:flutter/material.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';
import 'package:phone_taolet_desktop/classes/widget_size.dart';
import 'package:phone_taolet_desktop/widget/custem_text.dart';

class CustemButtom extends StatelessWidget {
  final String lable;

  final Color color;

  final double fontSize;

  final FontWeight fontWeight;

  final void Function() onTap;

  const CustemButtom(
      {Key? key,
      required this.lable,
      required this.fontSize,
      required this.fontWeight,
      required this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(AppWidgetSize.defaultHeight(context, 5)),
      onTap: onTap,
      child: Container(
        height: AppWidgetSize.defaultHeight(context, 16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorManger.black.withOpacity(0.5),
                offset: const Offset(0, 1),
                blurRadius: 2.0)
          ],
          borderRadius:
              BorderRadius.circular(AppWidgetSize.defaultHeight(context, 5)),
          color: ColorManger.primary,
        ),
        child: Center(
            child: CustemText(text: lable, fontsize: fontSize, color: color)),
      ),
    );
  }
}
