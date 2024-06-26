// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter_journo_blog_app/presentation/screens/auth/auth_imports.dart'
    as _i1;
import 'package:flutter_journo_blog_app/presentation/screens/auth/login/login_imports.dart'
    as _i5;
import 'package:flutter_journo_blog_app/presentation/screens/auth/register/register_imports.dart'
    as _i7;
import 'package:flutter_journo_blog_app/presentation/screens/general/categories/categories_imports.dart'
    as _i2;
import 'package:flutter_journo_blog_app/presentation/screens/general/general_imports.dart'
    as _i3;
import 'package:flutter_journo_blog_app/presentation/screens/general/home/home_imports.dart'
    as _i4;
import 'package:flutter_journo_blog_app/presentation/screens/general/home/home_model.dart'
    as _i12;
import 'package:flutter_journo_blog_app/presentation/screens/general/tags/tags_imports.dart'
    as _i9;
import 'package:flutter_journo_blog_app/presentation/screens/onboard/onboard_imports.dart'
    as _i6;
import 'package:flutter_journo_blog_app/presentation/screens/splash/splash_imports.dart'
    as _i8;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Auth(),
      );
    },
    CategoriesAddRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CategoriesAdd(),
      );
    },
    CategoriesUpdateRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CategoriesUpdate(),
      );
    },
    GeneralRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.General(),
      );
    },
    HomeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeDetails(
          key: args.key,
          post: args.post,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Login(),
      );
    },
    OnBoardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnBoard(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Register(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Splash(),
      );
    },
    TagsAddRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TagsAdd(),
      );
    },
    TagsUpdateRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TagsUpdate(),
      );
    },
  };
}

/// generated route for
/// [_i1.Auth]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoriesAdd]
class CategoriesAddRoute extends _i10.PageRouteInfo<void> {
  const CategoriesAddRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CategoriesAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesAddRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoriesUpdate]
class CategoriesUpdateRoute extends _i10.PageRouteInfo<void> {
  const CategoriesUpdateRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CategoriesUpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesUpdateRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.General]
class GeneralRoute extends _i10.PageRouteInfo<void> {
  const GeneralRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeDetails]
class HomeDetailsRoute extends _i10.PageRouteInfo<HomeDetailsRouteArgs> {
  HomeDetailsRoute({
    _i11.Key? key,
    required _i12.Post post,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          HomeDetailsRoute.name,
          args: HomeDetailsRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailsRoute';

  static const _i10.PageInfo<HomeDetailsRouteArgs> page =
      _i10.PageInfo<HomeDetailsRouteArgs>(name);
}

class HomeDetailsRouteArgs {
  const HomeDetailsRouteArgs({
    this.key,
    required this.post,
  });

  final _i11.Key? key;

  final _i12.Post post;

  @override
  String toString() {
    return 'HomeDetailsRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i5.Login]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnBoard]
class OnBoardRoute extends _i10.PageRouteInfo<void> {
  const OnBoardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Register]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Splash]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TagsAdd]
class TagsAddRoute extends _i10.PageRouteInfo<void> {
  const TagsAddRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TagsAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsAddRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TagsUpdate]
class TagsUpdateRoute extends _i10.PageRouteInfo<void> {
  const TagsUpdateRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TagsUpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsUpdateRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
