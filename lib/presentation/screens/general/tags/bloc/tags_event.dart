part of 'tags_bloc.dart';

@immutable
sealed class TagsEvent {}

class TagsInitialFetchEvent extends TagsEvent {}

class TagsClickButtonAddEvent extends TagsEvent {}

class TagsUpdateEvent extends TagsEvent {
  final TagsModel updatedTags;

  TagsUpdateEvent(this.updatedTags);
}

class TagsClickButtonRemoveTagsEvent extends TagsEvent {
  final int id;

  TagsClickButtonRemoveTagsEvent({required this.id});
}

class TagsClickButtonUpdateEvent extends TagsEvent {
  final Tag tag;

  TagsClickButtonUpdateEvent({required this.tag});
}
