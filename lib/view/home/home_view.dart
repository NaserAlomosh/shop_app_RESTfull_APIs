import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_taolet_desktop/classes/color_manager.dart';
import 'package:phone_taolet_desktop/view_model/home/home_cubit.dart';

import '../../view_model/home/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return SafeArea(
            child: Scaffold(
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: CurvedNavigationBar(
                key: bottomNavigationKey,
                index: 0,
                height: 50.h,
                buttonBackgroundColor: ColorManger.primary,
                items: <Widget>[
                  Icon(
                    Icons.home,
                    size: 25.h,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  Icon(
                    Icons.category,
                    size: 25.h,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 25.h,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  Icon(
                    Icons.settings,
                    size: 25.h,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ],
                color: ColorManger.primary.withOpacity(0.6),
                backgroundColor: ColorManger.primary.withOpacity(0.6),
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 400),
                onTap: (index) {
                  cubit.buttonNavigationBar(index);
                },
                letIndexChange: (index) => true,
              ),
            ),
          );
        },
      ),
    );
  }
}
