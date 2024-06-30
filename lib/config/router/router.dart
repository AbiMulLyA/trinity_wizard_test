import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';
import '../../module/presentation/ui/detail_contact_page.dart';

part 'router.gr.dart';

GlobalKey<NavigatorState> routerNavigator = GlobalKey<NavigatorState>();

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  AppRouter() : super(navigatorKey: routerNavigator);
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: DetailContactRoute.page,
    ),
  ];
}
