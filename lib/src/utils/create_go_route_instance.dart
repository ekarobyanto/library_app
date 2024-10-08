import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

createGoRouteInstance({
  required String route,
  Widget? screen,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  String? routeName,
  List<GoRoute>? routes,
  GlobalKey<NavigatorState>? navigatorKey,
}) {
  if (screen == null && pageBuilder == null) {
    throw AssertionError('screen or pageBuilder must be provided');
  }
  return GoRoute(
    path: route,
    name: routeName ?? route,
    parentNavigatorKey: navigatorKey,
    pageBuilder: pageBuilder ??
        (context, state) => MaterialPage(key: state.pageKey, child: screen!),
    routes: <GoRoute>[
      ...routes ?? [],
    ],
  );
}
