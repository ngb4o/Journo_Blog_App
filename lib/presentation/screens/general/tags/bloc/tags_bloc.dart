import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_model.dart';

import '../../../../../data/repositories/tags_repo.dart';

part 'tags_event.dart';

part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  final TagsRepo tagsRepo;

  TagsBloc(this.tagsRepo) : super(TagsInitial()) {
    on<TagsInitialFetchEvent>(tagsInitialFetchEvent);
    on<TagsUpdateEvent>(tagsUpdateEvent);
    on<TagsClickButtonRemoveTagsEvent>(tagsClickButtonRemoveTagsEvent);
  }

  FutureOr<void> tagsInitialFetchEvent(
      TagsInitialFetchEvent event, Emitter<TagsState> emit) async {
    emit(TagsLoadingState());
    var tagsData = await tagsRepo.getAllTags();
    if (tagsData.status == 1) {
      emit(TagsSuccessState(tagsModel: tagsData));
    }
  }

  FutureOr<void> tagsUpdateEvent(
      TagsUpdateEvent event, Emitter<TagsState> emit) async {
    emit(TagsSuccessState(tagsModel: event.updatedTags));
  }

  FutureOr<void> tagsClickButtonRemoveTagsEvent(
      TagsClickButtonRemoveTagsEvent event, Emitter<TagsState> emit) async {
    try {
      emit(TagsRemovingState());
      var data = await tagsRepo.deleteTags(event.id);
      if (data.status == 1) {
        emit(TagsRemovedSuccessState(messageModel: data));
        var updateData = await tagsRepo.getAllTags();
        if (updateData.status == 1) {
          emit(TagsSuccessState(tagsModel: updateData));
        } else {
          emit(TagsErrorState(message: 'Failed to fetch updated tags'));
        }
      } else {
        emit(TagsRemoveErrorState(message: 'Failed'));
      }
    } catch (e) {
      emit(TagsRemoveErrorState(message: e.toString()));
    }
  }
}
