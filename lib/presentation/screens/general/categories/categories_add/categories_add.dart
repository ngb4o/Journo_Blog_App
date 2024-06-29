part of 'categories_add_imports.dart';

@RoutePage<CategoriesModel>()
class CategoriesAdd extends StatefulWidget {
  const CategoriesAdd({super.key});

  @override
  State<CategoriesAdd> createState() => _CategoriesAddState();
}

class _CategoriesAddState extends State<CategoriesAdd> {
  final TextEditingController titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  _addCategories() {
    if (formKey.currentState!.validate()) {
      context.read<CategoriesAddBloc>().add(
            CategoriesClickButtonAddEvent(
              title: titleController.text.trim(),
              slug: titleController.text
                  .toLowerCase()
                  .replaceAll(' ', '-')
                  .trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesAddBloc, CategoriesAddState>(
      listener: (context, state) {
        if (state is CategoriesAddSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${state.messageModel.message}')),
          );
        } else if (state is CategoriesAddNavigatedToCategoriesState) {
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
            title: 'Add New Category'.text.white.make(),
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
                        return 'Title is empty !';
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
                        return 'Slug is empty !';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  if (state is CategoriesAddLoadingState)
                    LoadingSpinkit.loadingButton.pOnly(bottom: 10)
                  else
                    PrimaryButton(
                      title: 'Add',
                      onPressed: () {
                        _addCategories();
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
