import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_taolet_desktop/view/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {
  await ScreenUtil.ensureScreenSize();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnboardingView(),
        );
      },
    );
  }
}
























   // print(MediaQuery.of(context).size.height);
        // print(MediaQuery.of(context).size.width);