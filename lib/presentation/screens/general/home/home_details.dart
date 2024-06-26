part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  final Post post;

  const HomeDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Hero(
              tag: Key(post.id.toString()),
              child: CachedNetworkImage(
                imageUrl: post.featuredimage.toString(),
              ).cornerRadius(20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  10.h.heightBox,
                  '${post.title}'.text.bold.size(19).make(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(FeatherIcons.eye),
                      8.w.widthBox,
                      '${post.views} Views'.text.make(),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsUp,
                          color: Colors.green,
                        ),
                      ),
                      (post.like == null ? '0' : '${post.like}').text.make(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.thumbsDown,
                          color: Colors.red,
                        ),
                      ),
                      (post.dislike == null ? '0' : '${post.dislike}')
                          .text
                          .make(),
                    ],
                  ),
                  HtmlWidget(post.body!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
