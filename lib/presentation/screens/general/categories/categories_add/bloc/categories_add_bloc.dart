import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/categories/categories_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/repositories/categories_repo.dart';

part 'categories_add_event.dart';

part 'categories_add_state.dart';

class CategoriesAddBloc extends Bloc<CategoriesAddEvent, CategoriesAddState> {
  final CategoriesRepo categoriesRepo;

  CategoriesAddBloc(this.categoriesRepo) : super(CategoriesAddInitial()) {
    on<CategoriesClickButtonAddEvent>(categoriesClickButtonAddEvent);
  }

  FutureOr<void> categoriesClickButtonAddEvent(
      CategoriesClickButtonAddEvent event,
      Emitter<CategoriesAddState> emit) async {
    try {
      emit(CategoriesAddLoadingState());
      var data = await categoriesRepo.addCategories(event.title, event.slug);
      if (data.status == 1) {
        emit(CategoriesAddSuccessState(messageModel: data));
        var newData = await categoriesRepo.getAllCategories();
        if (newData.status == 1) {
          emit(CategoriesAddNavigatedToCategoriesState(
              categoriesModel: newData));
        }
      } else {
        emit(CategoriesAddErrorState(message: 'Error'));
      }
    } catch (e) {
      emit(CategoriesAddErrorState(message: e.toString()));
    }
  }
}
