import 'package:flutter_journo_blog_app/data/data_sources/remote/api_client.dart';
import 'package:flutter_journo_blog_app/data/data_sources/remote/api_endpoint_urls.dart';
import '../../presentation/screens/general/home/home_model.dart';

class PostsRepo extends ApiClient {
  PostsRepo();

  Future<HomeModel> getAllPosts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.posts);
      if(response.statusCode == 200) {
        final responseData = HomeModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception('Get Fail');
      }
    } on Exception catch (e) {
      throw Exception('Error');
    }
  }
}
