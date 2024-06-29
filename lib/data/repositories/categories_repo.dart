import 'package:flutter_journo_blog_app/data/data_sources/remote/api_client.dart';
import 'package:flutter_journo_blog_app/data/data_sources/remote/api_endpoint_urls.dart';

import '../../presentation/screens/general/categories/categories_model.dart';
import '../models/message_model.dart';

class CategoriesRepo extends ApiClient {
  CategoriesRepo();

  Future<CategoriesModel> getAllCategories() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.categories);
      if (response.statusCode == 200) {
        final responseDate = CategoriesModel.fromJson(response.data);
        return responseDate;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MessageModel> addCategories(String title, String slug) async {
    Map body = {
      "title": title,
      "slug": slug,
    };

    try {
      var response = await postRequest(
        path: ApiEndpointUrls.addCategories,
        body: body,
        isRequiredToken: true,
      );
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

  Future<MessageModel> removeCategories(int id) async {
    try {
      final response = await postRequest(
        path: '${ApiEndpointUrls.deleteCategories}/$id',
        isRequiredToken: true,
      );
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

  Future<MessageModel> updateCategories(
      int id, String title, String slug) async {
    Map body = {
      "id": id,
      "title": title,
      "slug": slug,
    };
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.updateCategories,
        body: body,
        isRequiredToken: true,
      );
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
