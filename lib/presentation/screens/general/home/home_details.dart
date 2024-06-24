part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Netflix Will Charge Money for Password Sharing'
            .text
            .white
            .ellipsis
            .make(),
        backgroundColor: MyColors.primaryColor,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            MyAssets.netflix,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                10.h.heightBox,
                'Netflix Will Charge Money for Password Sharing'
                    .text
                    .bold
                    .size(19)
                    .make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    '147 Views'.text.make(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                      ),
                    ),
                    '0'.text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                      ),
                    ),
                    '0'.text.make(),
                  ],
                ),
                'With the new policy, only users who are part of a “Netflix Household”—those who are using the same internet connection—will be able to access the account unless they are paid additional users added onto a Standard or Premium plan. Those who are currently borrowing a Netflix password will get an update when they try to log in that tells them how to start their own account, the Washington Post reported A Netflix spokesperson said that if a viewer who is outside of a household attempts to log into that household’s account, that person will “see notifications in the Netflix product flow prompting them to either port their profile to a new account using Profile Transfer or being added as an extra member” to an existing account, which would come at an additional cost. The company says it will use​​ information such as IP addresses, device IDs, and account activity to determine whether a device is part of a household, and insists that it will not collect GPS data from users. Netflix has said that customers will still be able to access their accounts while traveling, on their personal devices or a television in a hotel or vacation home. It remains unclear how long a device will be allowed to remain logged in from another location.'
                    .text
                    .make()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
