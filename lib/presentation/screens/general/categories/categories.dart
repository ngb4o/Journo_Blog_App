part of 'categories_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    context.read<CategoriesBloc>().add(CategoriesInitialFetchEvent());
    super.initState();
  }

  Future<void> _gotoCategoriesAdd(BuildContext context) async {
    final updateCategories = await AutoRouter.of(context)
        .push<CategoriesModel>(const CategoriesAddRoute());
    if (updateCategories != null) {
      context
          .read<CategoriesBloc>()
          .add(CategoriesUpdateEvent(updateCategories));
    }
  }

  Future<void> _gotoCategoriesUpdate(
      BuildContext context, Category category) async {
    final updateTags = await AutoRouter.of(context)
        .push<CategoriesModel>(CategoriesUpdateRoute(category: category));
    if (updateTags != null) {
      context.read<CategoriesBloc>().add(CategoriesUpdateEvent(updateTags));
    }
  }

  _removeCategories(int id) {
    context
        .read<CategoriesBloc>()
        .add(CategoriesClickButtonRemoveEvent(id: id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) => current is! CategoriesActionState,
      listenWhen: (previous, current) => current is CategoriesActionState,
      listener: (context, state) {
        if (state is CategoriesNavigatedToCategoriesAddState) {
          _gotoCategoriesAdd(context);
        } else if (state is CategoriesRemoveSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${state.messageModel.message}')),
          );
        } else if (state is CategoriesRemoveErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is CategoriesNavigatedToCategoriesUpdateState) {
          _gotoCategoriesUpdate(context, state.category);
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return LoadingSpinkit.loadingPage;
        } else if (state is CategoriesSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: 'Categories'.text.color(Colors.white).make(),
              centerTitle: true,
              automaticallyImplyLeading: false,
              //remove back
              backgroundColor: MyColors.primaryColor,
              actions: [
                GestureDetector(
                  onTap: () {
                    context.read<CategoriesBloc>().add(
                        CategoriesClickButtonNavigatedToCategoriesAddEvent());
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
                itemCount: state.categoriesModel.categoriesCount!,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) {
                  var categoriesData = state.categoriesModel.categories![index];
                  return Card(
                    child: ListTile(
                      title: '${categoriesData.title}'
                          .text
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
                                context.read<CategoriesBloc>().add(
                                      CategoriesClickButtonNavigatedToCategoriesUpdateEvent(
                                          category: categoriesData),
                                    );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _removeCategories(categoriesData.id!);
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
        } else if (state is CategoriesErrorState) {
          return Center(
            child: 'Error'.text.make(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
