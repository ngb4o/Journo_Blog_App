import 'package:flutter_journo_blog_app/data/data_sources/remote/api_endpoint_urls.dart';
import 'package:flutter_journo_blog_app/data/models/message_model.dart';
import 'package:flutter_journo_blog_app/presentation/screens/auth/login/login_model.dart';

import '../data_sources/remote/api_client.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModel> userLogin(String email, String password) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.login,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = LoginModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception('Login failed');
      }
    } on Exception {
      throw Exception('Login failed');
    }
  }

  Future<MessageModel> userLogout() async {
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.logout,
        isRequiredToken: true,
      );

      if (response.statusCode == 200) {
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception('Logout failed');
      }
    } on Exception {
      throw Exception('Logout failed');
    }
  }
}
