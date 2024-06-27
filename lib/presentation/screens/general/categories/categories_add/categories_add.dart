part of 'categories_add_imports.dart';

@RoutePage()
class CategoriesAdd extends StatefulWidget {
  const CategoriesAdd({super.key});

  @override
  State<CategoriesAdd> createState() => _CategoriesAddState();
}

class _CategoriesAddState extends State<CategoriesAdd> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: MyColors.primaryColor,
        title: 'Add New Category'.text.white.make(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Title'.text.bold.make(),
             TextFieldCustom(controller: titleController,),
            20.h.heightBox,
            'Slug'.text.bold.make(),
             TextFieldCustom(controller: slugController,),
            const Spacer(),
            PrimaryButton(
              title: 'Add',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
