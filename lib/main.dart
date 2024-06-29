import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_journo_blog_app/data/repositories/auth_repo.dart';
import 'package:flutter_journo_blog_app/data/repositories/categories_repo.dart';
import 'package:flutter_journo_blog_app/data/repositories/posts_repo.dart';
import 'package:flutter_journo_blog_app/data/repositories/tags_repo.dart';
import 'package:flutter_journo_blog_app/presentation/router/router_imports.dart';
import 'package:flutter_journo_blog_app/presentation/screens/auth/login/bloc/login_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/categories/bloc/categories_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/categories/categories_add/bloc/categories_add_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/categories/categories_update/bloc/categories_update_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/home/bloc/home_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/profile/bloc/profile_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/bloc/tags_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_add/bloc/tags_add_bloc.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_update/bloc/tags_update_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/themes/app_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc(AuthRepo());
    final TagsBloc tagsBloc = TagsBloc(TagsRepo());
    final ProfileBloc profileBloc = ProfileBloc(AuthRepo(), PostsRepo());
    final HomeBloc homeBloc = HomeBloc(PostsRepo());
    final TagsAddBloc tagsAddBloc = TagsAddBloc(TagsRepo());
    final TagsUpdateBloc tagsUpdateBloc = TagsUpdateBloc(TagsRepo());
    final CategoriesBloc categoriesBloc = CategoriesBloc(CategoriesRepo());
    final CategoriesAddBloc categoriesAddBloc =
        CategoriesAddBloc(CategoriesRepo());
    final CategoriesUpdateBloc categoriesUpdateBloc =
        CategoriesUpdateBloc(CategoriesRepo());

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => loginBloc,
            ),
            BlocProvider(
              create: (context) => homeBloc,
            ),
            BlocProvider(
              create: (context) => tagsBloc,
            ),
            BlocProvider(
              create: (context) => profileBloc,
            ),
            BlocProvider(
              create: (context) => tagsAddBloc,
            ),
            BlocProvider(
              create: (context) => tagsUpdateBloc,
            ),
            BlocProvider(
              create: (context) => categoriesBloc,
            ),
            BlocProvider(
              create: (context) => categoriesAddBloc,
            ),
            BlocProvider(
              create: (context) => categoriesUpdateBloc,
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Journo',
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            routerConfig: _appRouter.config(),
          ),
        );
      },
    );
  }
}
