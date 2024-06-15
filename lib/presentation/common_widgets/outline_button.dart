
part of 'common_widget_imports.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const OutlineButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
            side: const BorderSide(color: MyColors.white)),
      ),
      child: title
          .text
          .size(16)
          .fontWeight(FontWeight.w700)
          .color(Colors.white)
          .make(),
    );
  }
}
