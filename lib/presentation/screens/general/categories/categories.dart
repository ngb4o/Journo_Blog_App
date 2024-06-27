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
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              FeatherIcons.plus,
              color: Colors.white,
            ).pOnly(right: 10),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: '${index + 1}'.text.size(16).make(),
              title: 'Enter'.text.size(16).make(),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.restore_from_trash,
                        color: Colors.red,
                      ),
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
