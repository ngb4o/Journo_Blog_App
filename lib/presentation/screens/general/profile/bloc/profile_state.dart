part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccessState({required this.profileModel});
}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState({required this.message});
}

class ProfileLogoutLoadingState extends ProfileState {}

class ProfileLogoutSuccessState extends ProfileState {
  final MessageModel messageModel;

  ProfileLogoutSuccessState({required this.messageModel});
}

class ProfileLogoutErrorState extends ProfileState {
  final String message;

  ProfileLogoutErrorState({required this.message});
}
