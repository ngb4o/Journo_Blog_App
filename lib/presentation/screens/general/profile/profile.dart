part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _logout() {
    context.read<ProfileBloc>().add(ProfileLogoutButtonClickEvent());
  }

  Future<void> _refreshProfile() async {
    context.read<ProfileBloc>().add(ProfileInitialFetchDataEvent());
  }

  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileInitialFetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutSuccessState) {
          Utils.clearAllSavedData();
          AutoRouter.of(context).push(const AuthRoute());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logout Success')),
          );
        } else if (state is ProfileLogoutErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logout failed: ${state.message}')),
          );
        }
      },
      builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoadingState) {
          return LoadingSpinkit.loadingPage;
        } else if (state is ProfileSuccessState) {
          var profileData = state.profileModel.userDetails;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.primaryColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                GestureDetector(
                  onTap: () {
                    _logout();
                  },
                  child: const Icon(
                    FeatherIcons.logOut,
                    color: Colors.white,
                  ).pOnly(right: 10),
                ),
              ],
            ),
            body: RefreshIndicator(
              // keo man hinh load lai trang
              onRefresh: _refreshProfile,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 40),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: '${profileData!.profilePhotoUrl}',
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                radius: 70,
                                backgroundImage: imageProvider,
                              ),
                              placeholder: (context, url) => LoadingSpinkit.loadingImage,
                            ),
                            10.h.heightBox,
                            '${profileData.name}'.text.bold.xl2.white.make(),
                            '${profileData.email}'.text.size(14).white.make(),
                            20.h.heightBox,
                            '${profileData.about}'
                                .text
                                .align(TextAlign.center)
                                .white
                                .make(),
                            20.h.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    '${state.profileModel.postsCount}'
                                        .text
                                        .xl2
                                        .white
                                        .bold
                                        .make(),
                                    'Posts'.text.white.xl.make(),
                                  ],
                                ),
                                Column(
                                  children: [
                                    '0'.text.xl2.white.bold.make(),
                                    'Following'.text.white.xl.make(),
                                  ],
                                ),
                                Column(
                                  children: [
                                    '0'.text.xl2.white.bold.make(),
                                    'Followers'.text.white.xl.make(),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    30.h.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'My Posts'.text.bold.size(18).make(),
                          5.h.heightBox,
                          GridView.builder(
                            itemCount: state.profileModel.postsCount,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.9,
                            ),
                            itemBuilder: (context, index) {
                              var userProfilePosts =
                                  state.profileModel.posts![index];
                              var imagePath = userProfilePosts.featuredimage
                                  .toString()
                                  .prepend('https://techblog.codersangam.com/')
                                  .replaceAll('public', 'storage');
                              return Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: imagePath.toString(),
                                    placeholder: (context, url) => LoadingSpinkit.loadingImage,
                                  ).cornerRadius(10),
                                  10.h.heightBox,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      '${userProfilePosts.title}'
                                          .text
                                          .maxLines(3)
                                          .size(16)
                                          .color(Colors.black)
                                          .make()
                                          .expand(),
                                      const Icon(FeatherIcons.moreVertical)
                                    ],
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is ProfileErrorState) {
          return Center(
            child: 'Error'.text.make(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
