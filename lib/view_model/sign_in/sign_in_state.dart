part of 'sign_in_cubit.dart';

sealed class SignInState {}

final class SignInInitialState extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInErorrState extends SignInState {
  String? error;

  SignInErorrState({this.error});
}
