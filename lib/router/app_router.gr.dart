// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:tale_weaver/features/home_page/screens/home_screen.dart' as _i3;
import 'package:tale_weaver/features/home_tab/screens/account_screen.dart'
    as _i1;
import 'package:tale_weaver/features/welcome/screens/welcome_screen.dart'
    as _i4;
import 'package:tale_weaver/features/create_new/widgets/create_middleware.dart'
    as _i2;

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
    Home.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
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
/// [_i3.HomeScreen]
class Home extends _i5.PageRouteInfo<void> {
  const Home({List<_i5.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
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
