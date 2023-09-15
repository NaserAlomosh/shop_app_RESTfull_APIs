import 'package:flutter/material.dart';

class AppNavigator {
  static animationNavigator(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }
}
