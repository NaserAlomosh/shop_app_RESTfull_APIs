import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_taolet_desktop/classes/app_string.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';
import 'package:phone_taolet_desktop/classes/widget_size.dart';
import 'package:phone_taolet_desktop/widget/custem_button.dart';
import 'package:phone_taolet_desktop/widget/custem_text.dart';
import 'package:phone_taolet_desktop/widget/custem_text_fiald.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool obscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
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
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Lottie.asset(
                      'images/log_in.json',
                      fit: BoxFit.fill,
                      height: AppWidgetSize.defaultHeight(context, 2.5),
                      width: AppWidgetSize.defaultWidth(context, 1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppWidgetSize.defaultWidth(context, 8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppWidgetSize.defaultHeight(context, 3),
                          ),
                          child: Container(
                            height: AppWidgetSize.defaultHeight(context, 16),
                            width: AppWidgetSize.defaultWidth(context, 2.8),
                            color: ColorManger.white.withOpacity(0.5),
                            child: Center(
                              child: TextField(
                                controller: firstNameController,
                                obscureText: obscureText,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: AppString.firstName,
                                  hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: AppWidgetSize.defaultWidth(context, 8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppWidgetSize.defaultHeight(context, 3),
                          ),
                          child: Container(
                            height: AppWidgetSize.defaultHeight(context, 16),
                            width: AppWidgetSize.defaultWidth(context, 2.8),
                            color: ColorManger.white.withOpacity(0.5),
                            child: Center(
                              child: TextField(
                                controller: lastNameController,
                                obscureText: obscureText,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: AppString.lastName,
                                  hintStyle: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppWidgetSize.defaultHeight(context, 30),
                  ),
                  CustemTextFiald(
                    controller: phoneController,
                    lable: AppString.phone,
                    textInputType: TextInputType.phone,
                    icon: Icons.phone,
                  ),
                  SizedBox(
                    height: AppWidgetSize.defaultHeight(context, 30),
                  ),
                  CustemTextFiald(
                    controller: emailController,
                    lable: AppString.hintEmail,
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: AppWidgetSize.defaultHeight(context, 30),
                  ),
                  CustemTextFiald(
                    controller: passwordController,
                    lable: AppString.hintPassword,
                    obscureText: true,
                    icon: Icons.lock,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: AppWidgetSize.defaultWidth(context, 8),
                      left: AppWidgetSize.defaultWidth(context, 8),
                      top: AppWidgetSize.defaultWidth(context, 12),
                      bottom: AppWidgetSize.defaultWidth(context, 20),
                    ),
                    child: CustemButtom(
                      lable: AppString.signUp,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      onTap: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustemText(
                        text: AppString.youAlreadyHaveAnAccount,
                        fontsize: 12,
                        color: ColorManger.white,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CustemText(
                          text: AppString.signIn,
                          fontsize: 12,
                          color: ColorManger.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
