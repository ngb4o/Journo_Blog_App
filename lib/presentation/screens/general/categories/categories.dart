part of 'categories_imports.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Categories'.text.color(Colors.white).make(),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: 'Screen categories'.text.make(),
      ),
    );
  }
}
