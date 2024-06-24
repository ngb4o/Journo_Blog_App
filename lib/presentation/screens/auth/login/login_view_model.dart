part of 'login_imports.dart';

class LoginViewModel {
  final Repository repository;

  LoginViewModel({required this.repository});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login(context) async {
    var loginData = await repository.authRepo.userLogin(
      emailController.text.trim(),
      passwordController.text.trim(),
      context,
    );
    if (loginData.accessToken != null) {
      AutoRouter.of(context).push(const GeneralRoute());
    }
  }
}
