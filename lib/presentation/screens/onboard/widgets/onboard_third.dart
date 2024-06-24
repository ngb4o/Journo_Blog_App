part of 'widgets_imports.dart';

class OnBoardThird extends StatelessWidget {
  const OnBoardThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MyAssets.onBoard3,
          height: 333.h,
          width: 333.w,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: 'Explore a wide selection of categories, or use the search bar to '
                  'find specific topics.'
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
