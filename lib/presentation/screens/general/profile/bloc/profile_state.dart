part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLogoutLoadingState extends ProfileState {}

class ProfileLogoutSuccessState extends ProfileState {
  final MessageModel messageModel;

  ProfileLogoutSuccessState({required this.messageModel});
}

class ProfileLogoutErrorState extends ProfileState {
  final String message;

  ProfileLogoutErrorState({required this.message});
}
