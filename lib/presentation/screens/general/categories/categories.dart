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
        //remove back
        backgroundColor: MyColors.primaryColor,
        actions: const [
          Icon(
            FeatherIcons.plus,
            color: Colors.white,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: '${index + 1}'.text.size(16).make(),
              title: 'Enter'.text.size(16).make(),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FeatherIcons.edit2, color: Colors.green,),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FeatherIcons.trash, color: Colors.red,),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
