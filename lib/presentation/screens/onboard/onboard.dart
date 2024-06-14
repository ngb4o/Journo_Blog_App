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
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/main_logo.png',
                color: MyColors.primaryColor,
                height: 42,
                width: 139,
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
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryColor,
                  minimumSize: Size(MediaQuery.of(context).size.width, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: 'Get Started'
                    .text
                    .size(16)
                    .fontWeight(FontWeight.w700)
                    .color(Colors.white)
                    .make(),
              ),
              61.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Skip'
                      .text
                      .size(16)
                      .fontWeight(FontWeight.w700)
                      .color(MyColors.primaryColor)
                      .make(),
                  SmoothPageIndicator(
                    controller: onBoardViewModel.pageController,
                    // PageController
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: MyColors.primaryColor,
                      dotHeight: 12,
                      dotWidth: 12
                    ),
                    // your preferred effect
                    onDotClicked: (index) {},
                  ),
                  'Next'
                      .text
                      .size(16)
                      .fontWeight(FontWeight.w700)
                      .color(MyColors.primaryColor)
                      .make(),
                ],
              ),
              15.heightBox,
            ],
          ),
        ),
      ),
    ));
  }
}
