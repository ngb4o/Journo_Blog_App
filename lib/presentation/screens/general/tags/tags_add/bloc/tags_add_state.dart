part of 'tags_add_bloc.dart';

@immutable
sealed class TagsAddState {}

final class TagsAddInitial extends TagsAddState {}

abstract class TagsAddActionState extends TagsAddState {}

class TagsAddLoadingState extends TagsAddState {}

class TagsAddSuccessState extends TagsAddActionState {
  final MessageModel messageModel;

  TagsAddSuccessState({required this.messageModel});
}

class TagsAddFailedState extends TagsAddActionState {
  final String message;

  TagsAddFailedState({required this.message});
}

class TagsAddNavigatedToTagsState extends TagsAddActionState {
  final TagsModel tagsModel;

  TagsAddNavigatedToTagsState({required this.tagsModel});

}


