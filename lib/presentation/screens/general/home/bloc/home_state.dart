part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final HomeModel homeModel;

  HomeSuccessState({required this.homeModel});
}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
