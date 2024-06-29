part of 'categories_add_bloc.dart';

@immutable
sealed class CategoriesAddEvent {}

class CategoriesClickButtonAddEvent extends CategoriesAddEvent {
  final String title;
  final String slug;

  CategoriesClickButtonAddEvent({required this.title, required this.slug});
}
