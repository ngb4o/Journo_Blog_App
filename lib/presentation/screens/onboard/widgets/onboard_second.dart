part of 'widgets_imports.dart';

class OnBoardSecond extends StatelessWidget {
  const OnBoardSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MyAssets.onBoard2,
          height: 333.h,
          width: 333.w,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: 'Customize your reading experience and join the conversation by '
                  'creating an account.'
              .text
              .size(15.sp)
              .align(TextAlign.center)
              .fontWeight(FontWeight.w500)
              .make(),
        ),
      ],
    );
  }
}
