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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                MyAssets.mainLogo,
                width: 139.w,
                height: 42.h,
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
                          .size(18)
                          .color(MyColors.primaryColor)
                          .fontWeight(FontWeight.w700)
                          .makeCentered(),
                      48.h.heightBox,
                      'Email'.text.make(),
                      8.h.heightBox,
                      const VxTextField(
                        fillColor: Colors.transparent,
                        borderColor: MyColors.primaryColor,
                        borderType: VxTextFieldBorderType.roundLine,
                        borderRadius: 10,
                        prefixIcon: Icon(Icons.email),
                      ),
                      20.h.heightBox,
                      'Password'.text.make(),
                      8.h.heightBox,
                      const VxTextField(
                        isPassword: true,
                        obscureText: true,
                        fillColor: Colors.transparent,
                        borderColor: MyColors.primaryColor,
                        borderType: VxTextFieldBorderType.roundLine,
                        borderRadius: 10,
                        prefixIcon: Icon(Icons.lock),
                      ),
                      20.h.heightBox,
                      'Confirm Password'.text.make(),
                      8.h.heightBox,
                      const VxTextField(
                        isPassword: true,
                        obscureText: true,
                        fillColor: Colors.transparent,
                        borderColor: MyColors.primaryColor,
                        borderType: VxTextFieldBorderType.roundLine,
                        borderRadius: 10,
                        prefixIcon: Icon(Icons.lock),
                      ),
                      40.h.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 220,
                            child: CheckboxListTile(
                              value: false,
                              onChanged: (value) {},
                              title: 'Remember Me'.text.make(),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      40.h.heightBox,
                      PrimaryButton(
                        title: 'Login',
                        onPressed: () {},
                      ),
                      40.h.heightBox,
                      'Already have an account ? '
                          .richText
                          .size(14)
                          .color(MyColors.primaryColor)
                          .withTextSpanChildren([
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = ()=> AutoRouter.of(context).push(
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
    );
    ;
  }
}
