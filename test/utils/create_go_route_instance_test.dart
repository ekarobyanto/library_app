import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/utils/create_go_route_instance.dart';

void main() {
  group('createGoRouteInstance', () {
    testWidgets('creates GoRoute with minimal parameters', (tester) async {
      final route =
          createGoRouteInstance(route: '/test', screen: const Scaffold());
      expect(route.path, '/test');
      expect(route.pageBuilder, isNotNull);
    });

    testWidgets('creates GoRoute with custom pageBuilder', (tester) async {
      final route = createGoRouteInstance(
        route: '/custom',
        pageBuilder: (context, state) =>
            const MaterialPage(child: Text('Custom Page')),
      );
      expect(route.pageBuilder, isNotNull);
    });

    testWidgets('creates GoRoute with nested routes', (tester) async {
      final childRoute = GoRoute(
        path: '/child',
        pageBuilder: (context, state) => const MaterialPage(
          child: Text('Child'),
        ),
      );
      final route = createGoRouteInstance(
        route: '/parent',
        pageBuilder: (context, state) => const MaterialPage(
          child: Text('Custom Page'),
        ),
        routes: [childRoute],
      );
      expect(
        route.routes,
        contains(childRoute),
      );
    });

    testWidgets('throws AssertionError for null screen without pageBuilder',
        (tester) async {
      expect(
        () => createGoRouteInstance(route: '/error'),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
