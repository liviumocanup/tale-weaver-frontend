// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:tale_weaver/views/auth/forgot_password/forgot_password_screen.dart'
    as _i3;
import 'package:tale_weaver/views/auth/login/login_screen.dart' as _i5;
import 'package:tale_weaver/views/auth/sign_up/sign_up_screen.dart' as _i6;
import 'package:tale_weaver/views/auth/welcome/welcome_screen.dart' as _i7;
import 'package:tale_weaver/views/landing/account_management/account_screen.dart'
    as _i1;
import 'package:tale_weaver/views/landing/create_new/create_middleware.dart'
    as _i2;
import 'package:tale_weaver/views/landing/landing_screen.dart' as _i4;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    CreateNewStoryRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNewStoryRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CreateNewMiddle(
          key: args.key,
          description: args.description,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ForgotPasswordScreen(),
      );
    },
    LandingRoute.name: (routeData) {
      final args = routeData.argsAs<LandingRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LandingScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreateNewMiddle]
class CreateNewStoryRoute extends _i8.PageRouteInfo<CreateNewStoryRouteArgs> {
  CreateNewStoryRoute({
    _i9.Key? key,
    required String description,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CreateNewStoryRoute.name,
          args: CreateNewStoryRouteArgs(
            key: key,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateNewStoryRoute';

  static const _i8.PageInfo<CreateNewStoryRouteArgs> page =
      _i8.PageInfo<CreateNewStoryRouteArgs>(name);
}

class CreateNewStoryRouteArgs {
  const CreateNewStoryRouteArgs({
    this.key,
    required this.description,
  });

  final _i9.Key? key;

  final String description;

  @override
  String toString() {
    return 'CreateNewStoryRouteArgs{key: $key, description: $description}';
  }
}

/// generated route for
/// [_i3.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i8.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LandingScreen]
class LandingRoute extends _i8.PageRouteInfo<LandingRouteArgs> {
  LandingRoute({
    _i9.Key? key,
    required String user,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LandingRoute.name,
          args: LandingRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i8.PageInfo<LandingRouteArgs> page =
      _i8.PageInfo<LandingRouteArgs>(name);
}

class LandingRouteArgs {
  const LandingRouteArgs({
    this.key,
    required this.user,
  });

  final _i9.Key? key;

  final String user;

  @override
  String toString() {
    return 'LandingRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WelcomeScreen]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
