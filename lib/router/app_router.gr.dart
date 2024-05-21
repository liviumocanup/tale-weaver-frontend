// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:tale_weaver/features/generate_story/screens/studio_player.dart'
    as _i4;
import 'package:tale_weaver/features/home_page/screens/home_screen.dart' as _i2;
import 'package:tale_weaver/features/home_tab/screens/account_screen.dart'
    as _i1;
import 'package:tale_weaver/features/view_story/screens/story_view_screen.dart'
    as _i3;
import 'package:tale_weaver/features/welcome/screens/welcome_screen.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    Home.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    StoryViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoryViewRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.StoryViewScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    StudioPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<StudioPlayerRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.StudioPlayer(
          key: args.key,
          description: args.description,
          voiceId: args.voiceId,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i6.PageRouteInfo<void> {
  const AccountRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class Home extends _i6.PageRouteInfo<void> {
  const Home({List<_i6.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StoryViewScreen]
class StoryViewRoute extends _i6.PageRouteInfo<StoryViewRouteArgs> {
  StoryViewRoute({
    _i7.Key? key,
    required String id,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          StoryViewRoute.name,
          args: StoryViewRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryViewRoute';

  static const _i6.PageInfo<StoryViewRouteArgs> page =
      _i6.PageInfo<StoryViewRouteArgs>(name);
}

class StoryViewRouteArgs {
  const StoryViewRouteArgs({
    this.key,
    required this.id,
  });

  final _i7.Key? key;

  final String id;

  @override
  String toString() {
    return 'StoryViewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.StudioPlayer]
class StudioPlayerRoute extends _i6.PageRouteInfo<StudioPlayerRouteArgs> {
  StudioPlayerRoute({
    _i7.Key? key,
    required String description,
    required String voiceId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          StudioPlayerRoute.name,
          args: StudioPlayerRouteArgs(
            key: key,
            description: description,
            voiceId: voiceId,
          ),
          initialChildren: children,
        );

  static const String name = 'StudioPlayerRoute';

  static const _i6.PageInfo<StudioPlayerRouteArgs> page =
      _i6.PageInfo<StudioPlayerRouteArgs>(name);
}

class StudioPlayerRouteArgs {
  const StudioPlayerRouteArgs({
    this.key,
    required this.description,
    required this.voiceId,
  });

  final _i7.Key? key;

  final String description;

  final String voiceId;

  @override
  String toString() {
    return 'StudioPlayerRouteArgs{key: $key, description: $description, voiceId: $voiceId}';
  }
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
