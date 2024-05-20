import 'package:auto_route/auto_route.dart';
import 'package:tale_weaver/router/app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          path: "/",
        ),
        AutoRoute(page: Home.page),
        AutoRoute(page: AccountRoute.page),
        AutoRoute(page: StudioPlayerRoute.page),
        AutoRoute(page: StoryViewRoute.page),
      ];
}
