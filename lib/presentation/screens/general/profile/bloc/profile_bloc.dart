import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:flutter_journo_blog_app/data/repositories/posts_repo.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/profile/profile_model.dart';
import 'package:meta/meta.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../data/repositories/auth_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepo authRepo;
  final PostsRepo postRepo;

  ProfileBloc(this.authRepo, this.postRepo) : super(ProfileInitial()) {
    on<ProfileInitialFetchDataEvent>(profileInitialFetchDataEvent);
    on<ProfileLogoutButtonClickEvent>(profileLogoutButtonClickEvent);
  }

  FutureOr<void> profileInitialFetchDataEvent(
      ProfileInitialFetchDataEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoadingState());
      var profileData = await postRepo.getUserPosts();
      if (profileData.status == 1) {
        emit(ProfileSuccessState(profileModel: profileData));
      }
    } catch (e) {
      emit(ProfileErrorState(message: 'Loading Failed'));
    }
  }

  FutureOr<void> profileLogoutButtonClickEvent(
      ProfileLogoutButtonClickEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLogoutLoadingState());
    try {
      var logoutData = await authRepo.userLogout();
      if (logoutData.message.isNotEmptyAndNotNull) {
        emit(ProfileLogoutSuccessState(messageModel: logoutData));
      }
    } catch (e) {
      emit(ProfileLogoutErrorState(message: 'Logout Failed'));
    }
  }
}
