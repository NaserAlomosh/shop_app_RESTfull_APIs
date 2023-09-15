import 'package:flutter/material.dart';
import 'package:phone_taolet_desktop/classes/app_string.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';
import 'package:phone_taolet_desktop/classes/widget_size.dart';
import 'package:phone_taolet_desktop/view/sign_in/sign_in_view.dart';
import 'package:phone_taolet_desktop/view/onboarding/widget/custem_indicator.dart';
import 'package:phone_taolet_desktop/view/onboarding/widget/page_list_view.dart';
import 'package:phone_taolet_desktop/widget/custem_button.dart';
import 'package:phone_taolet_desktop/widget/custem_text.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.black.withOpacity(0.2),
              body: Stack(
                children: [
                  CustemPageView(pageController: pageController),
                  Positioned(
                    top: AppWidgetSize.defaultHeight(context, 30),
                    right: AppWidgetSize.defaultWidth(context, 20),
                    child: GestureDetector(
                      onTap: () {
                        pageController?.nextPage(
                          curve: Curves.easeIn,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                        );
                      },
                      child: Visibility(
                          visible: pageController!.hasClients
                              ? pageController!.page! == 2
                                  ? false
                                  : true
                              : true,
                          child: CustemText(
                              text: AppString.skip,
                              fontsize: 14,
                              color: ColorManger.white)),
                    ),
                  ),
                  Positioned(
                    left: AppWidgetSize.defaultWidth(context, 8),
                    right: AppWidgetSize.defaultWidth(context, 8),
                    bottom: AppWidgetSize.defaultWidth(context, 8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustemIndicator(
                              doteIndex: pageController!.hasClients
                                  ? pageController?.page
                                  : 0),
                          SizedBox(
                              height: AppWidgetSize.defaultHeight(context, 20)),
                          CustemButtom(
                            color: Colors.white,
                            onTap: () {
                              if (pageController!.page! < 2) {
                                pageController?.nextPage(
                                  curve: Curves.easeIn,
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                );
                              } else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SignInView()),
                                    (Route<dynamic> route) => false);
                              }
                            },
                            lable: pageController!.hasClients
                                ? pageController!.page == 2
                                    ? AppString.getStarted
                                    : AppString.next
                                : AppString.next,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}
