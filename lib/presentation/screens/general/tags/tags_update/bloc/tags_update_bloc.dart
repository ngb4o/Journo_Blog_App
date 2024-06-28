import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/repositories/tags_repo.dart';

part 'tags_update_event.dart';

part 'tags_update_state.dart';

class TagsUpdateBloc extends Bloc<TagsUpdateEvent, TagsUpdateState> {
  final TagsRepo tagsRepo;

  TagsUpdateBloc(this.tagsRepo) : super(TagsUpdateInitial()) {
    on<TagsUpdateClickButtonUpdateState>(tagsUpdateClickButtonUpdateState);
  }

  FutureOr<void> tagsUpdateClickButtonUpdateState(
      TagsUpdateClickButtonUpdateState event,
      Emitter<TagsUpdateState> emit) async {
    try {
      emit(TagsUpdateLoadingState());
      var responseData = await tagsRepo.updateTags(
        event.id,
        event.title,
        event.slug,
      );
      if (responseData.status == 1) {
        emit(TagsUpdateSuccessState(messageModel: responseData));
        var newData = await tagsRepo.getAllTags();
        emit(TagsUpdateNavigatedToTags(tagsModel: newData));
      } else {
        emit(TagsUpdateErrorState(message: 'Failed'));
      }
    } catch (e) {
      emit(TagsUpdateErrorState(message: e.toString()));
    }
  }
}
