part of 'tags_update_imports.dart';

@RoutePage()
class TagsUpdate extends StatefulWidget {
  const TagsUpdate({super.key});

  @override
  State<TagsUpdate> createState() => _TagsUpdateState();
}

class _TagsUpdateState extends State<TagsUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: MyColors.primaryColor,
        title: 'Update Tags'.text.white.make(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Title'.text.bold.make(),
            const TextFieldCustom(
              hintText: 'Entertaiments',
            ),
            20.h.heightBox,
            'Slug'.text.bold.make(),
            const TextFieldCustom(
              hintText: 'Entertaiments',
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Update',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
