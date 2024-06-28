part of 'tags_update_bloc.dart';

@immutable
sealed class TagsUpdateState {}

final class TagsUpdateInitial extends TagsUpdateState {}

abstract class TagsUpdateActionState extends TagsUpdateState {}

class TagsUpdateLoadingState extends TagsUpdateState {}

class TagsUpdateSuccessState extends TagsUpdateActionState {
  final MessageModel messageModel;

  TagsUpdateSuccessState({required this.messageModel});
}

class TagsUpdateErrorState extends TagsUpdateActionState {
  final String message;

  TagsUpdateErrorState({required this.message});
}

class TagsUpdateNavigatedToTags extends TagsUpdateActionState {
  final TagsModel tagsModel;

  TagsUpdateNavigatedToTags({required this.tagsModel});
}
