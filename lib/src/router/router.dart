import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/features/auth/auth_screen.dart';
import 'package:library_app/src/features/book/presentation/book_screen.dart';
import 'package:library_app/src/features/book/presentation/upload_book/book_form.dart';
import 'package:library_app/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:library_app/src/features/library/presentation/library_screen.dart';
import 'package:library_app/src/features/library/presentation/library_search.dart';
import 'package:library_app/src/features/main_scaffold.dart';
import 'package:library_app/src/utils/create_go_route_instance.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    createGoRouteInstance(
      route: '/',
      screen: AuthScreen(),
    ),
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
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LibraryScreen(),
          ),
          routes: [
            createGoRouteInstance(
              route: 'search-books',
              routeName: 'search-books',
              navigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: LibrarySearchScreen(),
              ),
            ),
          ],
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
    ),
    createGoRouteInstance(
      route: '/book-detail/:id',
      pageBuilder: (context, state) => MaterialPage(
        child: BookScreen(
          bookId: state.pathParameters['id']!,
        ),
      ),
    ),
    createGoRouteInstance(
      route: '/create-book',
      screen: const BookForm(),
    )
  ],
);
