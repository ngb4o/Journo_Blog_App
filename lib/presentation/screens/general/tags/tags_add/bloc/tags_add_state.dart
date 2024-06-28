part of 'tags_add_bloc.dart';

@immutable
sealed class TagsAddState {}

final class TagsAddInitial extends TagsAddState {}

abstract class TagsAddActionState extends TagsAddState {}

class TagsAddLoadingState extends TagsAddState {}

class TagsAddSuccessState extends TagsAddState {
  final MessageModel messageModel;

  TagsAddSuccessState({required this.messageModel});
}

class TagsAddFailedState extends TagsAddState {
  final String message;

  TagsAddFailedState({required this.message});
}

class TagsAddNavigatedToTags extends TagsAddActionState {
  final TagsModel tagsModel;

  TagsAddNavigatedToTags({required this.tagsModel});

}


