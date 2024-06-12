import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

createGoRouteInstance({
  required String route,
  required Widget screen,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  String? routeName,
  List<GoRoute>? routes,
}) {
  return GoRoute(
    path: route,
    name: routeName ?? route,
    pageBuilder: pageBuilder ??
        (context, state) => MaterialPage(key: state.pageKey, child: screen),
    routes: <GoRoute>[
      ...routes ?? [],
    ],
  );
}
