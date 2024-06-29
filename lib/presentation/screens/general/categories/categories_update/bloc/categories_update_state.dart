part of 'categories_update_bloc.dart';

@immutable
sealed class CategoriesUpdateState {}

final class CategoriesUpdateInitial extends CategoriesUpdateState {}

abstract class CategoriesUpdateActionState extends CategoriesUpdateState {}

class CategoriesUpdateLoadingState extends CategoriesUpdateState {}

class CategoriesUpdateSuccessState extends CategoriesUpdateActionState {
  final MessageModel messageModel;

  CategoriesUpdateSuccessState({required this.messageModel});
}

class CategoriesUpdateErrorState extends CategoriesUpdateActionState {
  final String message;

  CategoriesUpdateErrorState({required this.message});
}

class CategoriesUpdateNavigatedToCategoriesState
    extends CategoriesUpdateActionState {
  final CategoriesModel categoriesModel;

  CategoriesUpdateNavigatedToCategoriesState({required this.categoriesModel});
}


