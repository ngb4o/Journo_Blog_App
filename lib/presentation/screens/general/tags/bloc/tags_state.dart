part of 'tags_bloc.dart';

@immutable
sealed class TagsState {}

abstract class TagsActionState extends TagsState {}

final class TagsInitial extends TagsState {}

class TagsLoadingState extends TagsState {}

class TagsSuccessState extends TagsState {
  final TagsModel tagsModel;

  TagsSuccessState({required this.tagsModel});
}

class TagsErrorState extends TagsState {
  final String message;

  TagsErrorState({required this.message});
}

class TagsRemovingState extends TagsActionState {}

class TagsRemovedSuccessState extends TagsActionState {
  final MessageModel messageModel;

  TagsRemovedSuccessState({required this.messageModel});
}

class TagsRemoveErrorState extends TagsActionState {
  final String message;

  TagsRemoveErrorState({required this.message});
}
