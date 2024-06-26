import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/home/home_model.dart';
import 'package:meta/meta.dart';

import '../../../../../data/repositories/posts_repo.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostsRepo postsRepo;

  HomeBloc(this.postsRepo) : super(HomeInitial()) {
    on<HomeInitialFetchDataEvent>(homeInitialFetchDataEvent);
  }

  FutureOr<void> homeInitialFetchDataEvent(
      HomeInitialFetchDataEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      final data = await postsRepo.getAllPosts();
      if(data.status == 1) {
        emit(HomeSuccessState(homeModel: data));
      }
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
