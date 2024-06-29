part of 'categories_update_bloc.dart';

@immutable
sealed class CategoriesUpdateEvent {}

class CategoriesUpdateClickButtonUpdateEvent extends CategoriesUpdateEvent {
  final int id;
  final String title;
  final String slug;

  CategoriesUpdateClickButtonUpdateEvent({
    required this.id,
    required this.title,
    required this.slug,
  });
}
