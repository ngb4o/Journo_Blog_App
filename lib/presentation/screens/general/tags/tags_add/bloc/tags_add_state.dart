part of 'tags_add_bloc.dart';

@immutable
sealed class TagsAddState {}

final class TagsAddInitial extends TagsAddState {}

class TagsAddLoadingState extends TagsAddState {}

class TagsAddSuccessState extends TagsAddState {
  final MessageModel messageModel;

  TagsAddSuccessState({required this.messageModel});
}

class TagsAddFailedState extends TagsAddState {
  final String message;

  TagsAddFailedState({required this.message});
}
