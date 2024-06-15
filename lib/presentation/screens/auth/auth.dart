part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/auth_bg.png',

          ),
          fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.heightBox,

                Image.asset(
                  MyAssets.mainLogo,
                  width: 139,
                  height: 42,
                ).centered(),
                const Spacer(),
                'Explore the word,\nBillions of Thoughts.'
                    .text
                    .fontWeight(FontWeight.w700)
                    .align(TextAlign.start)
                    .size(28.sp)
                    .white
                    .make(),
                20.h.heightBox,
                //login button
                PrimaryButton(
                  title: 'Login',
                  onPressed: () =>
                      AutoRouter.of(context).push(const LoginRoute()),
                ),
                12.h.heightBox,
                //register button
                OutlineButton(
                  title: 'Register',
                  onPressed: () =>
                      AutoRouter.of(context).push(const RegisterRoute()),
                ),
                30.h.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
