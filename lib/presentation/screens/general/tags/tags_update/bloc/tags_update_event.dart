part of 'tags_update_bloc.dart';

@immutable
sealed class TagsUpdateEvent {}

class TagsUpdateClickButtonUpdateState extends TagsUpdateEvent {
  final int id;
  final String title;
  final String slug;

  TagsUpdateClickButtonUpdateState({
    required this.id,
    required this.title,
    required this.slug,
  });
}
