import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:phone_taolet_desktop/model/sign_in/sign_in_model.dart';
import 'package:phone_taolet_desktop/services/networking/post_data.dart';

import '../../services/locale/shared_preferences/set_data.dart';
import '../../services/networking/end_point.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());
  void userSignin({required String email, required String password}) async {
    SignInModel signInModel;
    try {
      emit(SignInLoadingState());
      await PostApiHelper.postData(
        query: LOGIN,
        data: {
          "email": email,
          "password": password,
        },
      ).then((response) async {
        if (response.statusCode == 200) {
          signInModel = SignInModel.fromJson(jsonDecode(response.body));
          await saveUserDataToSheredPrefreences(signInModel);
        } else {
          print('STATES CODE OF SIGN IN RESPONSE = ${response.statusCode}');
        }
      });
    } catch (e) {
      emit(SignInErorrState(error: 'LOG IN ERROR'));
    }
  }

  Future<void> saveUserDataToSheredPrefreences(SignInModel signInModel) async {
    if (signInModel.status == true) {
      bool token = await SetDataSharedPreferences()
          .setData(key: 'token', value: signInModel.data!.token);
      if (token) {
        await SetDataSharedPreferences()
            .setData(key: 'name', value: signInModel.data!.name);
        await SetDataSharedPreferences()
            .setData(key: 'email', value: signInModel.data!.email);
        await SetDataSharedPreferences()
            .setData(key: 'phone', value: signInModel.data!.phone);
        await SetDataSharedPreferences()
            .setData(key: 'image', value: signInModel.data!.image);
        emit(SignInSuccessState());
      } else {
        emit(SignInErorrState(
            error: 'ERROR SAVE TIKEN USER TO SHARED PREFERENCES'));
      }
    } else {
      emit(SignInErorrState(error: signInModel.message));
    }
  }
}
