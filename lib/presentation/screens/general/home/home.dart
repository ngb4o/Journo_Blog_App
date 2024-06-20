part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Image.asset(MyAssets.netflix).cornerRadius(20),
                20.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'Latest Post'.text.size(15).make(),
                    'See All'.text.size(15).make(),
                  ],
                ),
                10.h.heightBox,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // tat cuon
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.h,
                  ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => AutoRouter.of(context).push(
                            const HomeDetailsRoute(),
                          ),
                          child: Image.asset(
                            MyAssets.netflix,
                            width: 160,
                            height: 120,
                            fit: BoxFit.cover,
                          ).cornerRadius(20),
                        ),
                        10.w.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Netflix Will Charge Money for Password Sharing'
                                .text
                                .size(16)
                                .bold
                                .maxLines(2)
                                .color(Colors.black)
                                .make(),
                            6.h.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  FeatherIcons.clock,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                5.w.widthBox,
                                '6 Months ago'.text.color(Colors.grey).make(),
                              ],
                            ),
                            6.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                '59 Views'.text.color(Colors.grey).make(),
                                const Icon(
                                  FeatherIcons.bookmark,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                              ],
                            ),
                          ],
                        ).expand()
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
