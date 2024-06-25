part of 'tags_bloc.dart';

@immutable
sealed class TagsState {}

abstract class TagsActionState extends TagsState {}

final class TagsInitial extends TagsState {}

class TagsLoadingState extends TagsState {}

class TagsLoadedState extends TagsState {
  final TagsModel tagsModel;

  TagsLoadedState({required this.tagsModel});
}

class TagsErrorState extends TagsState {}
