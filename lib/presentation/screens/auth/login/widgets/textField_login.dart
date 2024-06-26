part of 'widget_imports.dart';

class TextFieldLogin extends StatelessWidget {
  final String hintText;
  final TextStyle hintTextStyle;
  final Icon iconTextField;
  final bool isPassword;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextFieldLogin({
    super.key,
    required this.hintText,
    required this.hintTextStyle,
    required this.iconTextField,
    this.isPassword = false,
    this.obscureText = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return VxTextField(
      hint: hintText,
      hintStyle: hintTextStyle,
      isPassword: isPassword,
      obscureText: obscureText,
      fillColor: Colors.transparent,
      borderColor: MyColors.primaryColor,
      suffixColor: MyColors.primaryColor,
      borderType: VxTextFieldBorderType.roundLine,
      borderRadius: 10,
      prefixIcon: iconTextField,
      controller: controller,
      validator: validator,
    );
  }
}
