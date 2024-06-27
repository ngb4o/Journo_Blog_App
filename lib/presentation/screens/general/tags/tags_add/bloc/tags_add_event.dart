part of 'tags_add_bloc.dart';

@immutable
sealed class TagsAddEvent {}

class TagsAddClickButtonAddEvent extends TagsAddEvent {
  final String title;
  final String slug;

  TagsAddClickButtonAddEvent({required this.title, required this.slug});
}
