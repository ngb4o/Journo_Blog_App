import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/categories/categories_model.dart';
import 'package:meta/meta.dart';

import '../../../../../data/repositories/categories_repo.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepo categoriesRepo;

  CategoriesBloc(this.categoriesRepo) : super(CategoriesInitial()) {
    on<CategoriesInitialFetchEvent>(categoriesInitialFetchEvent);
    on<CategoriesClickButtonNavigatedToCategoriesAddEvent>(
        categoriesClickButtonCategoriesAddEvent);
    on<CategoriesUpdateEvent>(categoriesUpdateEvent);
    on<CategoriesClickButtonRemoveEvent>(categoriesClickButtonRemoveEvent);
    on<CategoriesClickButtonNavigatedToCategoriesUpdateEvent>(
        categoriesClickButtonNavigatedToCategoriesUpdateEvent);
  }

  FutureOr<void> categoriesInitialFetchEvent(
      CategoriesInitialFetchEvent event, Emitter<CategoriesState> emit) async {
    try {
      emit(CategoriesLoadingState());
      var data = await categoriesRepo.getAllCategories();
      if (data.status == 1) {
        emit(CategoriesSuccessState(categoriesModel: data));
      } else {
        emit(CategoriesErrorState(message: 'Load Failed'));
      }
    } catch (e) {
      emit(CategoriesErrorState(message: e.toString()));
    }
  }

  FutureOr<void> categoriesClickButtonCategoriesAddEvent(
      CategoriesClickButtonNavigatedToCategoriesAddEvent event,
      Emitter<CategoriesState> emit) {
    emit(CategoriesNavigatedToCategoriesAddState());
  }

  FutureOr<void> categoriesUpdateEvent(
      CategoriesUpdateEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesSuccessState(categoriesModel: event.categoriesModel));
  }

  FutureOr<void> categoriesClickButtonRemoveEvent(
    CategoriesClickButtonRemoveEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      emit(CategoriesRemovingState());
      var data = await categoriesRepo.removeCategories(event.id);
      if (data.status == 1) {
        emit(CategoriesRemoveSuccessState(messageModel: data));
        var newData = await categoriesRepo.getAllCategories();
        emit(CategoriesSuccessState(categoriesModel: newData));
      } else {
        emit(CategoriesRemoveErrorState(message: 'Failed'));
      }
    } catch (e) {
      emit(CategoriesRemoveErrorState(message: e.toString()));
    }
  }

  FutureOr<void> categoriesClickButtonNavigatedToCategoriesUpdateEvent(
      CategoriesClickButtonNavigatedToCategoriesUpdateEvent event,
      Emitter<CategoriesState> emit) async {
    emit(CategoriesNavigatedToCategoriesUpdateState(category: event.category));
  }
}
