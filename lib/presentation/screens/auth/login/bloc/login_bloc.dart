import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/auth/login/login_model.dart';
import 'package:meta/meta.dart';

import '../../../../../data/repositories/auth_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;

  LoginBloc(this.authRepo) : super(LoginInitial()) {
    on<LoginButtonClickEvent>(loginButtonClickEvent);
  }

  FutureOr<void> loginButtonClickEvent(
      LoginButtonClickEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      var authData = await authRepo.userLogin(event.email, event.password);
      if (authData.accessToken != null) {
        emit(LoginSuccessState(loginModel: authData));
      }
    } catch (e) {
      emit(LoginErrorState(message: ' Invalid login credentials'));
    }
  }
}
