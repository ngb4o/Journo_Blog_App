part of 'tags_imports.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;

  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
    super.initState();
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
      body: BlocBuilder<VelocityBloc<TagsModel>, VelocityState<TagsModel>>(
        bloc: tagsViewModel.tagsModelBloc,
        builder: (context, state) {
          if(state is VelocityInitialState) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(state is VelocityUpdateState) {
            return ListView.separated(
              itemCount: state.data.tags!.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                var tagsData = state.data.tags![index];
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
          }
          return const SizedBox();
        },
      ),
    );
  }
}
