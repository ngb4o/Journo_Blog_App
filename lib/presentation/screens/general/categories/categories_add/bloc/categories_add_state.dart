part of 'categories_add_bloc.dart';

@immutable
sealed class CategoriesAddState {}

final class CategoriesAddInitial extends CategoriesAddState {}

abstract class CategoriesAddActionState extends CategoriesAddState {}

class CategoriesAddLoadingState extends CategoriesAddState {}

class CategoriesAddSuccessState extends CategoriesAddActionState {
  final MessageModel messageModel;

  CategoriesAddSuccessState({required this.messageModel});
}

class CategoriesAddErrorState extends CategoriesAddActionState {
  final String message;

  CategoriesAddErrorState({required this.message});
}

class CategoriesAddNavigatedToCategoriesState extends CategoriesAddActionState {
  final CategoriesModel categoriesModel;

  CategoriesAddNavigatedToCategoriesState({required this.categoriesModel});
}
