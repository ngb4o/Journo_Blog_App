part of 'tags_bloc.dart';

@immutable
sealed class TagsEvent {}

class TagsInitialFetchEvent extends TagsEvent {}

class TagsAddButtonNavigatorEvent extends TagsEvent {}

class TagsUpdateEvent extends TagsEvent {
  final TagsModel updatedTags;

  TagsUpdateEvent(this.updatedTags);
}