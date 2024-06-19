import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/features/auth/auth_screen.dart';
import 'package:library_app/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:library_app/src/features/main_scaffold.dart';
import 'package:library_app/src/utils/create_go_route_instance.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    createGoRouteInstance(route: '/', screen: AuthScreen()),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        createGoRouteInstance(
          route: '/dashboard',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DashboardScreen(),
          ),
        ),
        createGoRouteInstance(
          route: '/library',
          pageBuilder: (context, state) => NoTransitionPage(
            child: Container(),
          ),
        ),
        createGoRouteInstance(
          route: '/report',
          pageBuilder: (context, state) => NoTransitionPage(
            child: Container(),
          ),
        ),
        createGoRouteInstance(
          route: '/profile',
          pageBuilder: (context, state) => NoTransitionPage(
            child: Container(),
          ),
        ),
      ],
    )
  ],
);
