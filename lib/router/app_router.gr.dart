// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:tale_weaver/views/auth/welcome/welcome_screen.dart' as _i4;
import 'package:tale_weaver/views/landing/account_management/account_screen.dart'
    as _i1;
import 'package:tale_weaver/views/landing/create_new/create_middleware.dart'
    as _i2;
import 'package:tale_weaver/views/landing/landing_screen.dart' as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    CreateNewStoryRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNewStoryRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CreateNewMiddle(
          key: args.key,
          description: args.description,
        ),
      );
    },
    LandingRoute.name: (routeData) {
      final args = routeData.argsAs<LandingRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LandingScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i5.PageRouteInfo<void> {
  const AccountRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreateNewMiddle]
class CreateNewStoryRoute extends _i5.PageRouteInfo<CreateNewStoryRouteArgs> {
  CreateNewStoryRoute({
    _i6.Key? key,
    required String description,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CreateNewStoryRoute.name,
          args: CreateNewStoryRouteArgs(
            key: key,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateNewStoryRoute';

  static const _i5.PageInfo<CreateNewStoryRouteArgs> page =
      _i5.PageInfo<CreateNewStoryRouteArgs>(name);
}

class CreateNewStoryRouteArgs {
  const CreateNewStoryRouteArgs({
    this.key,
    required this.description,
  });

  final _i6.Key? key;

  final String description;

  @override
  String toString() {
    return 'CreateNewStoryRouteArgs{key: $key, description: $description}';
  }
}

/// generated route for
/// [_i3.LandingScreen]
class LandingRoute extends _i5.PageRouteInfo<LandingRouteArgs> {
  LandingRoute({
    _i6.Key? key,
    required String user,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          LandingRoute.name,
          args: LandingRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i5.PageInfo<LandingRouteArgs> page =
      _i5.PageInfo<LandingRouteArgs>(name);
}

class LandingRouteArgs {
  const LandingRouteArgs({
    this.key,
    required this.user,
  });

  final _i6.Key? key;

  final String user;

  @override
  String toString() {
    return 'LandingRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i4.WelcomeScreen]
class WelcomeRoute extends _i5.PageRouteInfo<void> {
  const WelcomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
