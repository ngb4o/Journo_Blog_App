part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileInitialFetchDataEvent extends ProfileEvent {}

class ProfileLogoutButtonClickEvent extends ProfileEvent {}
