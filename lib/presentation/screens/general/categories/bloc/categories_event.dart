part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

class CategoriesInitialFetchEvent extends CategoriesEvent {}

class CategoriesUpdateEvent extends CategoriesEvent {
  final CategoriesModel categoriesModel;

  CategoriesUpdateEvent(this.categoriesModel);
}

class CategoriesClickButtonNavigatedToCategoriesAddEvent
    extends CategoriesEvent {}

class CategoriesClickButtonRemoveEvent extends CategoriesEvent {
  final int id;

  CategoriesClickButtonRemoveEvent({required this.id});
}

class CategoriesClickButtonNavigatedToCategoriesUpdateEvent
    extends CategoriesEvent {
  final Category category;

  CategoriesClickButtonNavigatedToCategoriesUpdateEvent(
      {required this.category});
}
