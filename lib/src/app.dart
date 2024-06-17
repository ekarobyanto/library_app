import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              firebaseAuthService: context.read<FirebaseAuthService>(),
            )..checkAuthState(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Library App',
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: appFont.fontFamily,
            primaryColor: color.primaryColor,
            splashColor: color.primaryShade,
          ),
        ),
      ),
    );
  }
}
