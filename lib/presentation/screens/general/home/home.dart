part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc(PostsRepo());

  @override
  void initState() {
    homeBloc.add(HomeInitialFetchDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSuccessState) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      VxSwiper.builder(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: state.homeModel.popularPosts!.length,
                        itemBuilder: (context, index) {
                          var lastestPost =
                              state.homeModel.popularPosts![index];
                          return CachedNetworkImage(
                            imageUrl: lastestPost.featuredimage.toString(),
                            fit: BoxFit.cover,
                          ).cornerRadius(20).pSymmetric(h: 10);
                        },
                      ),
                      20.h.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'Latest Post'.text.size(15).make(),
                          'See All'.text.size(15).make(),
                        ],
                      ).pSymmetric(h: 24.w),
                      10.h.heightBox,
                      ListView.separated(
                        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 25),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // tat cuon
                        itemCount: state.homeModel.allPosts!.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.h,
                        ),
                        itemBuilder: (context, index) {
                          var lastestPosts = state.homeModel.allPosts![index];
                          return FadedScaleAnimation(
                            child: GestureDetector(
                              onTap: () => AutoRouter.of(context).push(
                                HomeDetailsRoute(post: lastestPosts),
                              ),
                              child: Row(
                                children: [
                                  Hero(
                                    tag: Key(lastestPosts.id.toString()),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          lastestPosts.featuredimage.toString(),
                                      width: 160,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ).cornerRadius(20),
                                  ),
                                  10.w.widthBox,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      '${lastestPosts.title}'
                                          .text
                                          .size(16)
                                          .bold
                                          .maxLines(2)
                                          .color(Colors.black)
                                          .make(),
                                      6.h.heightBox,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FeatherIcons.clock,
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                          5.w.widthBox,
                                          lastestPosts.createdAt!
                                              .timeAgo()
                                              .toString()
                                              .text
                                              .color(Colors.grey)
                                              .make(),
                                        ],
                                      ),
                                      6.h.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          '${lastestPosts.views} Views'
                                              .text
                                              .color(Colors.grey)
                                              .make(),
                                          const Icon(
                                            FeatherIcons.bookmark,
                                            color: Colors.grey,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ).expand()
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: 'Loading Faild'.text.make(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
