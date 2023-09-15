import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_taolet_desktop/classes/app_string.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';
import 'package:phone_taolet_desktop/classes/navigator.dart';
import 'package:phone_taolet_desktop/classes/widget_size.dart';
import 'package:phone_taolet_desktop/view/home/home_view.dart';
import 'package:phone_taolet_desktop/view/sign_up/sign_up_view.dart';
import 'package:phone_taolet_desktop/view_model/sign_in/sign_in_cubit.dart';
import 'package:phone_taolet_desktop/widget/custem_button.dart';
import 'package:phone_taolet_desktop/widget/custem_text.dart';
import 'package:phone_taolet_desktop/widget/custem_text_fiald.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool obscureText = false;
  var fromKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<SignInCubit>(
        create: (context) => SignInCubit(),
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
                      icon: Icons.lock,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppWidgetSize.defaultHeight(context, 200),
                        horizontal: AppWidgetSize.defaultWidth(context, 7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustemText(
                            text: AppString.forgetPassword,
                            fontsize: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppWidgetSize.defaultWidth(context, 8),
                        left: AppWidgetSize.defaultWidth(context, 8),
                        top: AppWidgetSize.defaultWidth(context, 14),
                        bottom: AppWidgetSize.defaultWidth(context, 20),
                      ),
                      child: BlocConsumer<SignInCubit, SignInState>(
                        listener: (context, state) {
                          if (state is SignInSuccessState) {
                            AppNavigator.animationNavigator(
                                context, const HomeView());
                          }
                        },
                        builder: (context, state) {
                          if (state is SignInLoadingState) {
                            return Center(
                              child: Lottie.asset(
                                'images/loading.json',
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                CustemButtom(
                                  lable: AppString.signIn,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  onTap: () {
                                    context.read<SignInCubit>().userSignin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                  },
                                ),
                                SizedBox(
                                  height:
                                      AppWidgetSize.defaultHeight(context, 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    //
                                    AppNavigator.animationNavigator(
                                        context, const SignUpView());
                                  },
                                  child: CustemText(
                                    text: AppString.signUp,
                                    fontsize: 12,
                                    color: ColorManger.white,
                                  ),
                                )
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
