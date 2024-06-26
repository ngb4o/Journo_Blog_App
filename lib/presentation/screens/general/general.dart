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
    ),
    TabItem(
      icon: FeatherIcons.plus,
    ),
    TabItem(
      icon: FeatherIcons.hash,
    ),
    TabItem(
      icon: FeatherIcons.user,
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
      bottomNavigationBar: BottomBarInspiredInside(
        items: items,
        backgroundColor: MyColors.white,
        color: MyColors.primaryColor,
        colorSelected: MyColors.white,
        indexSelected: visit,
        iconSize: 24,
        onTap: (int index) => setState(() {
          visit = index;
        }),
        chipStyle: const ChipStyle(
            convexBridge: true, background: MyColors.primaryColor),
        itemStyle: ItemStyle.circle,
        animated: false,
      ),
    );
  }
}
