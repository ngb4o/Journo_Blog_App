import 'package:velocity_x/velocity_x.dart';
import '../../presentation/screens/general/tags/tags_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';
import '../models/message_model.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.tags);
      if (response.statusCode == 200) {
        final responseData = TagsModel.fromJson(response.data);
        return responseData;
      } else {
        TagsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      TagsModel();
    }
    return TagsModel();
  }

  Future<MessageModel> addTags(String title, String slug) async {
    Map body = {
      "title": title,
      "slug": slug,
    };
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.addTags, body: body, isRequiredToken: true);
      if (response.statusCode == 200) {
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MessageModel> deleteTags(int id) async {
    try {
      final response = await postRequest(
          path: '${ApiEndpointUrls.deleteTags}/$id', isRequiredToken: true);
      if (response.statusCode == 200) {
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MessageModel> updateTags(int id, String title, String slug) async {
    Map body = {
      "id": id,
      "title": title,
      "slug": slug,
    };
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.updateTags, body: body, isRequiredToken: true);
      if (response.statusCode == 200) {
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
