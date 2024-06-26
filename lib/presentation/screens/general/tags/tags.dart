part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  final TagsBloc tagsBloc = TagsBloc(TagsRepo());

  @override
  void initState() {
    tagsBloc.add(TagsInitialFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    tagsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Tags'.text.color(Colors.white).make(),
        centerTitle: true,
        automaticallyImplyLeading: false,
        //remove back
        backgroundColor: MyColors.primaryColor,
        actions: [
          GestureDetector(
            onTap: () => AutoRouter.of(context).push(const TagsAddRoute()),
            child: const Icon(
              FeatherIcons.plus,
              color: Colors.white,
            ).pOnly(right: 10),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => tagsBloc,
        child: BlocConsumer<TagsBloc, TagsState>(
          listenWhen: (previous, current) => current is TagsActionState,
          buildWhen: (previous, current) => current is! TagsActionState,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is TagsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TagsSuccessState) {
              return ListView.separated(
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
                              onPressed: () => AutoRouter.of(context)
                                  .push(const TagsUpdateRoute()),
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
              );
            } else if (state is TagsErrorState) {
              return Center(
                child: 'Error !!!'.text.make(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
