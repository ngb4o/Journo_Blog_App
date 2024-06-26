part of 'widget_imports.dart';

class TextFieldRegister extends StatelessWidget {
  final Icon iconTextField;
  final bool isPassword;
  final bool obscureText;

  const TextFieldRegister({
    super.key,
    required this.iconTextField,
    this.isPassword = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      isPassword: isPassword,
      obscureText: obscureText,
      fillColor: Colors.transparent,
      borderColor: MyColors.primaryColor,
      suffixColor: MyColors.primaryColor,
      borderType: VxTextFieldBorderType.roundLine,
      borderRadius: 10,
      prefixIcon: iconTextField,
    );
  }
}
