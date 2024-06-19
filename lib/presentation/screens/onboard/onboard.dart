part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnBoardViewModel onBoardViewModel = OnBoardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            15.h.heightBox,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(
                MyAssets.mainLogo,
                color: MyColors.primaryColor,
                height: 42.h,
                width: 139.w,
              ),
            ),
            63.heightBox,
            PageView(
              controller: onBoardViewModel.pageController,
              children: const [
                OnBoardFirst(),
                OnBoardSecond(),
                OnBoardThird(),
              ],
            ).expand(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                title: 'Get Started',
                onPressed: () => AutoRouter.of(context).push(const AuthRoute()),
              ),
            ),
            61.h.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Skip'
                      .text
                      .size(16.sp)
                      .fontWeight(FontWeight.w700)
                      .color(MyColors.primaryColor)
                      .make(),
                  SmoothPageIndicator(
                    controller: onBoardViewModel.pageController,
                    // PageController
                    count: 3,
                    effect: const WormEffect(
                        activeDotColor: MyColors.primaryColor,
                        dotHeight: 12,
                        dotWidth: 12),
                    // your preferred effect
                    onDotClicked: (index) {},
                  ),
                  'Next'
                      .text
                      .size(16.sp)
                      .fontWeight(FontWeight.w700)
                      .color(MyColors.primaryColor)
                      .make(),
                ],
              ),
            ),
            30.h.heightBox,
          ],
        ),
      ),
    ));
  }
}
