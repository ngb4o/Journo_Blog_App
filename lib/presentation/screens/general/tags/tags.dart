part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  void initState() {
    super.initState();
    context.read<TagsBloc>().add(TagsInitialFetchEvent());
  }

  Future<void> _gotoTagsAdd( BuildContext context) async {
    final updateTags =
        await AutoRouter.of(context).push<TagsModel>(const TagsAddRoute());
    if (updateTags != null) {
      context.read<TagsBloc>().add(TagsUpdateEvent(updateTags));
    }
  }

  Future<void> _gotoTagsUpdate(BuildContext context, Tag tag) async {
    final updateTags =
        await AutoRouter.of(context).push<TagsModel>(TagsUpdateRoute(tag: tag));
    if (updateTags != null) {
      context.read<TagsBloc>().add(TagsUpdateEvent(updateTags));
    }
  }

  _deleteTags(int id) async {
    context.read<TagsBloc>().add(TagsClickButtonRemoveTagsEvent(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TagsBloc, TagsState>(
      buildWhen: (previous, current) => current is! TagsActionState,
      listenWhen: (previous, current) => current is TagsActionState,
      listener: (context, state) {
        if (state is TagsRemovedSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${state.messageModel.message}')),
          );
        } else if (state is TagsRemoveErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$state.message')));
        } else if (state is TagsNavigatedToTagsAddState) {
          _gotoTagsAdd(context);
        } else if(state is TagsNavigatedToTagsUpdateState) {
         _gotoTagsUpdate(context, state.tag);
        }
      },
      builder: (context, state) {
        if (state is TagsLoadingState) {
          return LoadingSpinkit.loadingPage;
        } else if (state is TagsSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: 'Tags'.text.color(Colors.white).make(),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: MyColors.primaryColor,
              actions: [
                GestureDetector(
                  onTap: () {
                    context.read<TagsBloc>().add(TagsClickButtonNavigatedToTagsAddEvent());
                  },
                  child: const Icon(
                    FeatherIcons.plus,
                    color: Colors.white,
                  ).pOnly(right: 10),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: ListView.separated(
                itemCount: state.tagsModel.tags!.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  var tagsData = state.tagsModel.tags![index];
                  return Card(
                    child: ListTile(
                      title: tagsData.title!.text
                          .fontWeight(FontWeight.w700)
                          .size(16)
                          .make()
                          .pOnly(left: 10),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<TagsBloc>().add(
                                    TagsClickButtonNavigatedToTagsUpdateEvent(tag: tagsData));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _deleteTags(tagsData.id!);
                              },
                              icon: const Icon(
                                Icons.restore_from_trash,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is TagsErrorState) {
          return Center(
            child: 'Error !!!'.text.make(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
