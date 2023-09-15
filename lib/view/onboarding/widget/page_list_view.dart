import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_taolet_desktop/classes/widget_size.dart';

class CustemPageView extends StatelessWidget {
  final PageController? pageController;

  const CustemPageView({Key? key, required this.pageController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppWidgetSize.defaultHeight(context, 2.5),
        child: PageView(
          controller: pageController,
          children: [
            Lottie.asset('images/onbording1.json'),
            Lottie.asset('images/onbording2.json'),
            Lottie.asset('images/onbording3.json'),
          ],
        ),
      ),
    );
  }
}
