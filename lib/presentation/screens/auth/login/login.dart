part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final LoginBloc loginBloc = LoginBloc(AuthRepo());
  bool rememberMe = false;

  void _login() {
    if (formKey.currentState!.validate()) {
      loginBloc.add(
        LoginButtonClickEvent(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Utils.saveToken(state.loginModel.accessToken.toString());
              AutoRouter.of(context).push(const GeneralRoute());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text('Login Success: ${state.loginModel.message}')),
              );
            } else if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login failed: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return FadedScaleAnimation(
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
                      Form(
                        key: formKey,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
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
                                TextFieldLogin(
                                  iconTextField: const Icon(
                                    Icons.email,
                                    color: MyColors.primaryColor,
                                  ),
                                  controller: emailController,
                                  validator: (email) {
                                    if (email!.isEmpty) {
                                      return 'Email is empty !';
                                    } else if (!email.isValidEmail) {
                                      return 'Invalid email !';
                                    }
                                    return null;
                                  },
                                ),
                                20.h.heightBox,
                                'Password'
                                    .text
                                    .color(MyColors.primaryColor)
                                    .size(14)
                                    .fontWeight(FontWeight.w600)
                                    .make(),
                                8.h.heightBox,
                                TextFieldLogin(
                                  iconTextField: const Icon(
                                    Icons.lock,
                                    color: MyColors.primaryColor,
                                  ),
                                  isPassword: true,
                                  obscureText: true,
                                  controller: passwordController,
                                  validator: (password) {
                                    if (password!.isEmpty) {
                                      return 'Password is empty !';
                                    }
                                    return null;
                                  },
                                ),
                                20.h.heightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                side: const BorderSide(
                                                  color: MyColors.primaryColor,
                                                ),
                                                value: rememberMe,
                                                onChanged: (value) {
                                                  setState(() {
                                                    rememberMe = value!;
                                                  });
                                                },
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
                                if (state is LoginLoadingState)
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                else
                                  PrimaryButton(
                                    title: 'Login',
                                    onPressed: _login,
                                  ),
                                40.h.heightBox,
                                'Don\'t have an account ? '
                                    .richText
                                    .size(15)
                                    .color(MyColors.primaryColor)
                                    .withTextSpanChildren(
                                  [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => AutoRouter.of(context).push(
                                                  const RegisterRoute(),
                                                ),
                                      text: 'Sign Up',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                  ],
                                ).makeCentered(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
