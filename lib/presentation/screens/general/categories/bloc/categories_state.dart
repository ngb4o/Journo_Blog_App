part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

abstract class CategoriesActionState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final CategoriesModel categoriesModel;

  CategoriesSuccessState({required this.categoriesModel});
}

class CategoriesErrorState extends CategoriesState {
  final String message;

  CategoriesErrorState({required this.message});
}

class CategoriesNavigatedToCategoriesAddState extends CategoriesActionState {}

class CategoriesRemovingState extends CategoriesActionState {}

class CategoriesRemoveSuccessState extends CategoriesActionState {
  final MessageModel messageModel;

  CategoriesRemoveSuccessState({required this.messageModel});
}

class CategoriesRemoveErrorState extends CategoriesActionState {
  final String message;

  CategoriesRemoveErrorState({required this.message});
}

class CategoriesNavigatedToCategoriesUpdateState extends CategoriesActionState {
  final Category category;

  CategoriesNavigatedToCategoriesUpdateState({required this.category});
}
