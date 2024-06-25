import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:meta/meta.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../data/repositories/auth_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepo authRepo;
  ProfileBloc(this.authRepo) : super(ProfileInitial()) {
    on<ProfileLogoutButtonClickEvent>(profileLogoutButtonClickEvent);
  }

  FutureOr<void> profileLogoutButtonClickEvent(ProfileLogoutButtonClickEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLogoutLoadingState());
    try {
      var logoutData = await authRepo.userLogout();
      if(logoutData.message.isNotEmptyAndNotNull) {
        emit(ProfileLogoutSuccessState(messageModel: logoutData));
      }
    } catch (e) {
      emit(ProfileLogoutErrorState(message: 'Logout Failed'));
    }
  }
}
