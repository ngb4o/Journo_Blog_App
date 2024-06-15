part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: FadedScaleAnimation(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                30.h.heightBox,
                Image.asset(
                  MyAssets.mainLogo,
                  width: 139,
                  height: 42,
                ).centered(),
                100.h.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.h.heightBox,
                        'Register'
                            .text
                            .size(28)
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w700)
                            .makeCentered(),
                        20.h.heightBox,
                        'Email'
                            .text
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w600)
                            .make(),
                        8.h.heightBox,
                        const TextFieldRegister(
                          iconTextField: Icon(
                            Icons.email,
                            color: MyColors.primaryColor,
                          ),
                        ),
                        20.h.heightBox,
                        'Password'
                            .text
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w600)
                            .make(),
                        8.h.heightBox,
                        const TextFieldRegister(
                          iconTextField: Icon(
                            Icons.lock,
                            color: MyColors.primaryColor,
                          ),
                          obscureText: true,
                          isPassword: true,
                        ),
                        20.h.heightBox,
                        'Confirm Password'
                            .text
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w600)
                            .make(),
                        8.h.heightBox,
                        const TextFieldRegister(
                          iconTextField: Icon(
                            Icons.lock,
                            color: MyColors.primaryColor,
                          ),
                          obscureText: true,
                          isPassword: true,
                        ),
                        10.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 220,
                              child: Row(
                                children: [
                                  Checkbox(
                                    side: const BorderSide(
                                      color: MyColors.primaryColor,
                                    ),
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  'Remember Me'
                                      .text
                                      .color(MyColors.primaryColor)
                                      .fontWeight(FontWeight.w600)
                                      .size(14)
                                      .make(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        10.h.heightBox,
                        PrimaryButton(
                          title: 'Sign Up',
                          onPressed: () {},
                        ),
                        30.h.heightBox,
                        'Already have an account ? '
                            .richText
                            .size(14)
                            .color(MyColors.primaryColor)
                            .withTextSpanChildren([
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => AutoRouter.of(context).push(
                                    const LoginRoute(),
                                  ),
                            text: 'Login',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]).makeCentered(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
