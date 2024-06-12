import 'package:go_router/go_router.dart';
import 'package:library_app/src/features/auth/login/login_screen.dart';
import 'package:library_app/src/features/auth/register/register_screen.dart';
import 'package:library_app/src/utils/create_go_route_instance.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    createGoRouteInstance(route: '/', screen: const LoginScreen()),
    createGoRouteInstance(
      route: '/register',
      routeName: 'register',
      screen: const RegisterScreen(),
    ),
  ],
);
