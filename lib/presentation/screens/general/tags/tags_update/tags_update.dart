part of 'tags_update_imports.dart';

@RoutePage<TagsModel>()
class TagsUpdate extends StatefulWidget {
  final Tag tag;
  const TagsUpdate({super.key, required this.tag});

  @override
  State<TagsUpdate> createState() => _TagsUpdateState();
}

class _TagsUpdateState extends State<TagsUpdate> {
  final TextEditingController titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.tag.title!;
  }

  _updateTags(int id, String title, String slug) {
    context.read<TagsUpdateBloc>().add(
          TagsUpdateClickButtonUpdateState(
            id: id,
            title: title,
            slug: slug,
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
        title: 'Update Tags'.text.white.make(),
        centerTitle: true,
      ),
      body: BlocConsumer<TagsUpdateBloc, TagsUpdateState>(
        listener: (context, state) {
          if (state is TagsUpdateSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.messageModel.message}')),
            );
          } else if (state is TagsUpdateErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is TagsUpdateNavigatedToTags) {
            AutoRouter.of(context).pop<TagsModel>(state.tagsModel);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'Title'.text.color(MyColors.primaryColor).bold.make(),
                TextFieldCustom(
                  controller: titleController,
                  borderColor: MyColors.primaryColor,
                  validator: (titleController) {
                    if (titleController!.isEmpty) {
                      return 'Slug is empty !';
                    }
                    return null;
                  },
                ),
                20.h.heightBox,
                'Slug'.text.color(MyColors.primaryColor).bold.make(),
                TextFieldCustom(
                  controller: titleController,
                  borderColor: MyColors.primaryColor,
                  validator: (titleController) {
                    if (titleController!.isEmpty) {
                      return 'Slug is empty !';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                if (state is TagsUpdateLoadingState)
                  Center(
                    child: const CircularProgressIndicator(
                      color: MyColors.primaryColor,
                    ).pOnly(bottom: 20),
                  )
                else
                  PrimaryButton(
                    title: 'Update',
                    onPressed: () {
                      _updateTags(
                        widget.tag.id!,
                        titleController.text.trim(),
                        titleController.text
                            .toLowerCase()
                            .replaceAll(' ', '-')
                            .trim(),
                      );
                    },
                  ).pOnly(bottom: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

// part of 'tags_add_imports.dart';
//
// @RoutePage<TagsModel>()
// class TagsAdd extends StatefulWidget {
//   const TagsAdd({super.key});
//
//   @override
//   State<TagsAdd> createState() => _TagsAddState();
// }
//
// class _TagsAddState extends State<TagsAdd> {
//   final TextEditingController titleController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   _addTags() {
//     if (formKey.currentState!.validate()) {
//       context.read<TagsAddBloc>().add(
//         TagsAddClickButtonAddEvent(
//           title: titleController.text.trim(),
//           slug: titleController.text
//               .toLowerCase()
//               .replaceAll(' ', '-')
//               .trim(),
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     titleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: MyColors.primaryColor,
//         title: 'Add New Tags'.text.white.make(),
//         centerTitle: true,
//       ),
//       body: BlocConsumer<TagsAddBloc, TagsAddState>(
//         listener: (context, state) {
//           if (state is TagsAddSuccessState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('${state.messageModel.message}')),
//             );
//           } else if (state is TagsAddNavigatedToTags) {
//             AutoRouter.of(context).pop<TagsModel>(state.tagsModel);
//           }
//         },
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   'Title'.text.bold.color(MyColors.primaryColor).make(),
//                   TextFieldCustom(
//                     controller: titleController,
//                     validator: (titleController) {
//                       if(titleController!.isEmpty) {
//                         return 'Title is empty !';
//                       }
//                       return null;
//                     },
//                     borderColor: MyColors.primaryColor,
//                   ),
//                   20.h.heightBox,
//                   'Slug'.text.bold.color(MyColors.primaryColor).make(),
//                   TextFieldCustom(
//                     controller: titleController,
//                     validator: (titleController) {
//                       if(titleController!.isEmpty) {
//                         return 'Slug is empty !';
//                       }
//                       return null;
//                     },
//                     borderColor: MyColors.primaryColor,
//                   ),
//                   const Spacer(),
//                   if (state is TagsAddLoadingState)
//                     Center(
//                       child: const CircularProgressIndicator(
//                         color: MyColors.primaryColor,
//                       ).pOnly(bottom: 20),
//                     )
//                   else
//                     PrimaryButton(
//                       title: 'Add',
//                       onPressed: _addTags,
//                     ).pOnly(bottom: 20),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
