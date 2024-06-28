import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_model.dart';

import '../../../../../data/repositories/tags_repo.dart';

part 'tags_event.dart';

part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  final TagsRepo tagsRepo;

  TagsBloc(this.tagsRepo) : super(TagsInitial()) {
    on<TagsInitialFetchEvent>(tagsInitialFetchEvent);
    on<TagsAddButtonNavigatorEvent>(tagsAddButtonNavigatorEvent);
    on<TagsUpdateEvent>(tagsUpdateEvent);
  }

  FutureOr<void> tagsInitialFetchEvent(
      TagsInitialFetchEvent event, Emitter<TagsState> emit) async {
    emit(TagsLoadingState());
    var tagsData = await tagsRepo.getAllTags();
    if (tagsData.status == 1) {
      emit(TagsSuccessState(tagsModel: tagsData));
    }
  }

  FutureOr<void> tagsAddButtonNavigatorEvent(
      TagsAddButtonNavigatorEvent event, Emitter<TagsState> emit) async {
    emit(TagsNavigatedToTagsAddActionState());
  }

  FutureOr<void> tagsUpdateEvent(
      TagsUpdateEvent event, Emitter<TagsState> emit) async {
    emit(TagsSuccessState(tagsModel: event.updatedTags));
  }
}
