part of 'categories_imports.dart';

@RoutePage()
class CategoriesUpdate extends StatelessWidget {
  const CategoriesUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: MyColors.primaryColor,
        title: 'Update Categories'.text.white.make(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Title'.text.bold.make(),
            TextFieldCustom(hintText: 'Reviews',),
            20.h.heightBox,
            'Slug'.text.bold.make(),
            TextFieldCustom(hintText: 'Reviews',),
            Spacer(),
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
