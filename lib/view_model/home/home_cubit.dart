import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:phone_taolet_desktop/model/home/home_model.dart';

import 'package:phone_taolet_desktop/services/locale/shared_preferences/get_data.dart';
import 'package:phone_taolet_desktop/services/networking/end_point.dart';
import 'package:phone_taolet_desktop/services/networking/get_data.dart';
import 'package:phone_taolet_desktop/view/categories/categories.dart';
import 'package:phone_taolet_desktop/view/favorite/favorite.dart';
import 'package:phone_taolet_desktop/view/product/prodect_view.dart';
import 'package:phone_taolet_desktop/view/settings/settings.dart';
import 'package:phone_taolet_desktop/view_model/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  HomeModel? homeModel;

  int currentIndex = 0;
  List<Widget> screens = [
    const ProdectView(),
    const CategoriesView(),
    const FavoriteView(),
    const SettingsView(),
  ];
  buttonNavigationBar(int index) {
    //
    currentIndex = index;
    emit(ChangeButtonNavigationState());
    //
  }

  Future<void> getHomeData() async {
    print('###################');
    emit(HomeLoadingState());
    var token = await GetDataSharedPreferences().getData(key: 'token');
    await GetApiHelper.getData(query: HOME, token: token.toString())
        .then((value) {
      if (value.statusCode == 200) {
        homeModel = HomeModel.fromJson(jsonDecode(value.body));
        print('TTTTTTTTTTTTTTTTTTTTTEEEEEEEEEEEEESSSSSSSSSSSSSTTTTTTTTTTT');
        print(homeModel);
        emit(HomeSuccessState());
      } else {}
    });
  }
}
