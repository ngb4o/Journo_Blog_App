part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          const Icon(
            FeatherIcons.logOut,
            color: Colors.white,
          ).pOnly(right: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(MyAssets.netflix),
                    ),
                    10.h.heightBox,
                    'Ngb4o'.text.bold.xl2.white.make(),
                    'ngbao08052003@gmail.com'.text.size(14).white.make(),
                    20.h.heightBox,
                    'As an aspiring Mobile Developer, I am actively seeking an internship opportunity to apply my academic knowledge and hands-on experience in mobile app development'
                        .text
                        .align(TextAlign.center)
                        .white
                        .make(),
                    20.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            '6'.text.xl3.white.bold.make(),
                            'Posts'.text.white.xl.make(),
                          ],
                        ),
                        Column(
                          children: [
                            '0'.text.xl3.white.bold.make(),
                            'Following'.text.white.xl.make(),
                          ],
                        ),
                        Column(
                          children: [
                            '0'.text.xl3.white.bold.make(),
                            'Followers'.text.white.xl.make(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            20.h.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'My Posts'.text.bold.size(18).make(),
                  20.h.heightBox,
                  GridView.builder(
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(
                            MyAssets.netflix,
                            fit: BoxFit.cover,
                          ).cornerRadius(20),
                          10.h.heightBox,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Netflix Will Charge Money for Password Sharing'
                                  .text
                                  .maxLines(3)
                                  .size(16)
                                  .color(Colors.black)
                                  .make()
                                  .expand(),
                              Icon(FeatherIcons.moreVertical)
                            ],
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
