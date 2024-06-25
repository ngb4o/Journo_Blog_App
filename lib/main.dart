import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_journo_blog_app/data/repositories/auth_repo.dart';
import 'package:flutter_journo_blog_app/data/repositories/tags_repo.dart';
import 'package:flutter_journo_blog_app/presentation/router/router_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/themes/app_themes.dart';
import 'data/repositories/repository.dart';

void main() {
  // runApp(
  //   RepositoryProvider(
  //     create: (context) => Repository(
  //       tagsRepo: TagsRepo(),
  //       authRepo: AuthRepo(),
  //     ),
  //     child: MyApp(),
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Journo',
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
