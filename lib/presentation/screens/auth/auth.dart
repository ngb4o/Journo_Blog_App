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
                Image.asset(
                  MyAssets.mainLogo,
                  width: 139.w,
                  height: 42.h,
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

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                  ),
                  child: 'Login'
                      .text
                      .size(16)
                      .fontWeight(FontWeight.w700)
                      .color(Colors.white)
                      .make(),
                ),
                12.h.heightBox,
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.r),
                        side: const BorderSide(color: MyColors.white)),
                  ),
                  child: 'Register'
                      .text
                      .size(16)
                      .fontWeight(FontWeight.w700)
                      .color(Colors.white)
                      .make(),
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
