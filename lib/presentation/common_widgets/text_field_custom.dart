part of 'common_widget_imports.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final Color borderColor;

  const TextFieldCustom({
    super.key,
    this.hintText = '',
    this.fillColor = Colors.grey,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      borderType: VxTextFieldBorderType.roundLine,
      borderColor: borderColor,
      borderRadius: 10,
      fillColor: fillColor.withOpacity(0.2),
      hint: hintText,
    );
  }
}
