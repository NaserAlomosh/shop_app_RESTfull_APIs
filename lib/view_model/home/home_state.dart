abstract class HomeState {}

final class ChangeButtonNavigationState extends HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {}

final class HomeErorrState extends HomeState {
  String? error;
  HomeErorrState({this.error});
}
