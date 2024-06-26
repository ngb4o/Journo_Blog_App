part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialFetchDataEvent extends HomeEvent {}
