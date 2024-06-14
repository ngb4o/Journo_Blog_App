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
    return Container(
      color: MyColors.primaryColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36)
                      )
                  ),
                  child: Column(
                    children: [
                      50.h.heightBox,
                      'Login'.text.color(MyColors.primaryColor).make()
                    ],
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
