part of 'tags_add_imports.dart';

@RoutePage()
class TagsAdd extends StatefulWidget {
  const TagsAdd({super.key});

  @override
  State<TagsAdd> createState() => _TagsAddState();
}

class _TagsAddState extends State<TagsAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: MyColors.primaryColor,
        title: 'Add New Tags'.text.white.make(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Title'.text.bold.make(),
            const TextFieldCustom(),
            20.h.heightBox,
            'Slug'.text.bold.make(),
            const TextFieldCustom(),
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
