import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/core/auth/repository/auth_repository.dart';
import 'package:library_app/src/core/auth/service/firebase_auth_service.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          lazy: false,
          create: (context) => FirebaseAuthService(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
              firebaseAuthService: context.read<FirebaseAuthService>(),
            )..checkAuthState(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Library App',
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: color.primaryColor,
            splashColor: color.primaryShade,
            fontFamily: appFont.fontFamily,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: color.primaryShade,
                backgroundColor: color.primaryColor,
                textStyle: TextStyle(
                  color: color.primaryShade,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
