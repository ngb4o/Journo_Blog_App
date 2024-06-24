part of 'categories_imports.dart';

@RoutePage()
class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

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
            TextFieldCustom(),
            20.h.heightBox,
            'Slug'.text.bold.make(),
            TextFieldCustom(),
            Spacer(),
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
