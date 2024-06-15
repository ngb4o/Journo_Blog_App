part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        'Login'
                            .text
                            .size(28)
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.bold)
                            .makeCentered(),
                        30.h.heightBox,
                        'Email'
                            .text
                            .color(MyColors.primaryColor)
                            .size(14)
                            .fontWeight(FontWeight.w600)
                            .make(),
                        8.h.heightBox,
                        const TextFieldLogin(
                          iconTextField: Icon(
                            Icons.email,
                            color: MyColors.primaryColor,
                          ),
                        ),
                        20.h.heightBox,
                        'Password'
                            .text
                            .color(MyColors.primaryColor)
                            .size(14)
                            .fontWeight(FontWeight.w600)
                            .make(),
                        8.h.heightBox,
                        const TextFieldLogin(
                          iconTextField: Icon(
                            Icons.lock,
                            color: MyColors.primaryColor,
                          ),
                          isPassword: true,
                          obscureText: true,
                        ),
                        20.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                            Expanded(
                              child: 'Forgot Password'
                                  .text
                                  .size(14)
                                  .fontWeight(FontWeight.w600)
                                  .align(TextAlign.center)
                                  .color(MyColors.primaryColor)
                                  .make(),
                            ),
                          ],
                        ),
                        20.h.heightBox,
                        PrimaryButton(
                          title: 'Login',
                          onPressed: () => AutoRouter.of(context).push(
                            const GeneralRoute(),
                          ),
                        ),
                        40.h.heightBox,
                        'Don\'t have an account ? '
                            .richText
                            .size(15)
                            .color(MyColors.primaryColor)
                            .withTextSpanChildren([
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => AutoRouter.of(context).push(
                                    const RegisterRoute(),
                                  ),
                            text: 'Sign Up',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
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
  }
}
