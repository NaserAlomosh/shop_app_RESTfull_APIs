import 'package:flutter/material.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';

import '../../classes/widget_size.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/log_in.jpg',
              fit: BoxFit.fill,
              height: AppWidgetSize.defaultHeight(context, 1),
              width: AppWidgetSize.defaultWidth(context, 1),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: ColorManger.black.withOpacity(0.1),
          body: const Center(
            child: Text('SettingsView'),
          ),
        ),
      ],
    );
  }
}
