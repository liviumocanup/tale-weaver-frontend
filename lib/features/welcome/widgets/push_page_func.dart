import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

// TODO: Implement a Navigator Manager
void pushPage(BuildContext context, PageRouteInfo page) {
  context.router.push(page);
}

void replaceAllPages(BuildContext context, PageRouteInfo page) {
  context.router.replaceAll([page]);
}