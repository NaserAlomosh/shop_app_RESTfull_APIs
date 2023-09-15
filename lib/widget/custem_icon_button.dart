import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';

class CustemIconButtom extends StatelessWidget {
  final IconData icon;

  final Function() onTap;

  const CustemIconButtom({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: ColorManger.white.withOpacity(0.8),
        size: 25.w,
      ),
      // color: ColorManger.white,
    );
  }
}
