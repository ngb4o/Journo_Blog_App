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
    BlocProvider.of<TagsBloc>(context).add(TagsInitialFetchEvent());
  }

  Future<void> _gotoTagsAdd(BuildContext context) async {
    final updateTags =
        await AutoRouter.of(context).push<TagsModel>(const TagsAddRoute());
    if (updateTags != null) {
      BlocProvider.of<TagsBloc>(context).add(TagsUpdateEvent(updateTags));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TagsBloc, TagsState>(
      listener: (context, state) {
        if (state is TagsNavigatedToTagsAddActionState) {
          _gotoTagsAdd(context);
        }
      },
      builder: (context, state) {
        if (state is TagsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColors.primaryColor,
            ),
          );
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
                    BlocProvider.of<TagsBloc>(context)
                        .add(TagsAddButtonNavigatorEvent());
                  },
                  child: const Icon(
                    FeatherIcons.plus,
                    color: Colors.white,
                  ).pOnly(right: 10),
                ),
              ],
            ),
            body: ListView.separated(
              itemCount: state.tagsModel.tags!.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                var tagsData = state.tagsModel.tags![index];
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: '${index + 1}'.text.size(16).make(),
                    title: tagsData.title!.text.size(16).make(),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
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
