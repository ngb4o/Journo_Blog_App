part of 'categories_update_imports.dart';

@RoutePage<CategoriesModel>()
class CategoriesUpdate extends StatefulWidget {
  final Category category;

  const CategoriesUpdate({super.key, required this.category});

  @override
  State<CategoriesUpdate> createState() => _CategoriesUpdateState();
}

class _CategoriesUpdateState extends State<CategoriesUpdate> {
  final TextEditingController titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController.text = widget.category.title.toString();
    super.initState();
  }

  _updateCategories(int id, String title, String slug) {
    if (formKey.currentState!.validate()) {
      context.read<CategoriesUpdateBloc>().add(
            CategoriesUpdateClickButtonUpdateEvent(
              id: id,
              title: title,
              slug: slug,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesUpdateBloc, CategoriesUpdateState>(
      buildWhen: (previous, current) => current is! CategoriesUpdateActionState,
      listenWhen: (previous, current) => current is CategoriesUpdateActionState,
      listener: (context, state) {
        if (state is CategoriesUpdateSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${state.messageModel.message}')),
          );
        } else if (state is CategoriesUpdateErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is CategoriesUpdateNavigatedToCategoriesState) {
          AutoRouter.of(context).pop<CategoriesModel>(state.categoriesModel);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            backgroundColor: MyColors.primaryColor,
            title: 'Update Categories'.text.white.make(),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Title'.text.bold.make(),
                  TextFieldCustom(
                    controller: titleController,
                    validator: (titleController) {
                      if (titleController!.isEmpty) {
                        return 'Title is empty';
                      }
                      return null;
                    },
                  ),
                  20.h.heightBox,
                  'Slug'.text.bold.make(),
                  TextFieldCustom(
                    controller: titleController,
                    validator: (titleController) {
                      if (titleController!.isEmpty) {
                        return 'Slug is empty';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  if (state is CategoriesUpdateLoadingState)
                    LoadingSpinkit.loadingButton.pOnly(bottom: 10)
                  else
                    PrimaryButton(
                      title: 'Update',
                      onPressed: () {
                        _updateCategories(
                          widget.category.id!,
                          titleController.text.trim(),
                          titleController.text
                              .toLowerCase()
                              .replaceAll(' ', '-')
                              .trim(),
                        );
                      },
                    ).pOnly(bottom: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
