part of 'tags_add_imports.dart';

@RoutePage<TagsModel>()
class TagsAdd extends StatefulWidget {
  const TagsAdd({super.key});

  @override
  State<TagsAdd> createState() => _TagsAddState();
}

class _TagsAddState extends State<TagsAdd> {
  final TextEditingController titleController = TextEditingController();

  _addTags() {
    context.read<TagsAddBloc>().add(
          TagsAddClickButtonAddEvent(
            title: titleController.text.trim(),
            slug:
                titleController.text.toLowerCase().replaceAll(' ', '-').trim(),
          ),
        );
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        title: 'Add New Tags'.text.white.make(),
        centerTitle: true,
      ),
      body: BlocConsumer<TagsAddBloc, TagsAddState>(
        listener: (context, state) {
          if (state is TagsAddSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.messageModel.message}')),
            );
          }else if (state is TagsAddNavigatedToTags) {
            AutoRouter.of(context).pop<TagsModel>(state.tagsModel);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'Title'.text.bold.make(),
                TextFieldCustom(
                  controller: titleController,
                ),
                20.h.heightBox,
                'Slug'.text.bold.make(),
                TextFieldCustom(
                  controller: titleController,
                ),
                const Spacer(),
                if (state is TagsAddLoadingState)
                  Center(
                    child: const CircularProgressIndicator(
                      color: MyColors.primaryColor,
                    ).pOnly(bottom: 20),
                  )
                else
                  PrimaryButton(
                    title: 'Add',
                    onPressed: _addTags,
                  ).pOnly(bottom: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
