part of 'common_widget_imports.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.withOpacity(0.8),
              MyColors.primaryColor,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(11.r)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(MediaQuery.of(context).size.width, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
          ),
        ),
        child: title.text
            .size(16.sp)
            .fontWeight(FontWeight.w700)
            .color(Colors.white)
            .make(),
      ),
    );
  }
}
