import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/repositories/tags_repo.dart';

part 'tags_add_event.dart';

part 'tags_add_state.dart';

class TagsAddBloc extends Bloc<TagsAddEvent, TagsAddState> {
  final TagsRepo tagsRepo;

  TagsAddBloc(this.tagsRepo) : super(TagsAddInitial()) {
    on<TagsAddClickButtonAddEvent>(tagsAddClickButtonAddEvent);
  }

  FutureOr<void> tagsAddClickButtonAddEvent(
      TagsAddClickButtonAddEvent event, Emitter<TagsAddState> emit) async {
    try {
      emit(TagsAddLoadingState());
      var responseData = await tagsRepo.addTags(event.title, event.slug);
      if (responseData.status == 1) {
        emit(TagsAddSuccessState(messageModel: responseData));
        var newData = await tagsRepo.getAllTags();
        emit(TagsAddNavigatedToTagsState(tagsModel: newData));
      } else {
        emit(TagsAddFailedState(message: 'Failed to add tags'));
      }
    } catch (e) {
      emit(TagsAddFailedState(message: e.toString()));
    }
  }
}
