import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/categories/categories_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/models/message_model.dart';
import '../../../../../../data/repositories/categories_repo.dart';

part 'categories_update_event.dart';

part 'categories_update_state.dart';

class CategoriesUpdateBloc
    extends Bloc<CategoriesUpdateEvent, CategoriesUpdateState> {
  final CategoriesRepo categoriesRepo;

  CategoriesUpdateBloc(this.categoriesRepo) : super(CategoriesUpdateInitial()) {
    on<CategoriesUpdateClickButtonUpdateEvent>(
        categoriesUpdateClickButtonUpdateState);
  }

  FutureOr<void> categoriesUpdateClickButtonUpdateState(
      CategoriesUpdateClickButtonUpdateEvent event,
      Emitter<CategoriesUpdateState> emit) async {
    try {
      emit(CategoriesUpdateLoadingState());
      var responseData = await categoriesRepo.updateCategories(
        event.id,
        event.title,
        event.slug,
      );
      if (responseData.status == 1) {
        emit(CategoriesUpdateSuccessState(messageModel: responseData));
        var newData = await categoriesRepo.getAllCategories();
        emit(CategoriesUpdateNavigatedToCategoriesState(categoriesModel: newData));
      } else {
        emit(CategoriesUpdateErrorState(message: 'Failed'));
      }
    } catch (e) {
      emit(CategoriesUpdateErrorState(message: e.toString()));
    }
  }
}
