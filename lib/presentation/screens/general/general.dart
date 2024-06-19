part of 'general_imports.dart';

@RoutePage()
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  List<TabItem> items = const [
    TabItem(
      icon: FeatherIcons.home,
    ),
    TabItem(
      icon: FeatherIcons.tag,
      // title: 'Shop',
    ),
    TabItem(
      icon: FeatherIcons.plus,
      // title: 'Wishlist',
    ),
    TabItem(
      icon: FeatherIcons.hash,
      // title: 'Cart',
    ),
    TabItem(
      icon: FeatherIcons.user,
      // title: 'profile',
    ),
  ];

  int visit = 0;

  List<Widget> pages = [
    const Home(),
    const Categories(),
    const AddPosts(),
    const Tags(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(visit),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 30, right: 32, left: 32),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: BottomBarFloating(
          borderRadius: BorderRadius.circular(30),
          enableShadow: false,
          items: items,
          backgroundColor: Colors.white,
          color: MyColors.primaryColor.withOpacity(0.3),
          colorSelected: MyColors.primaryColor,
          indexSelected: visit,
          paddingVertical: 24,
          iconSize: 24,
          onTap: (int index) => setState(
            () {
              visit = index;
            },
          ),
        ),
      ),
    );
  }
}
