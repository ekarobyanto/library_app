import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/core/auth/repository/auth_repository.dart';
import 'package:library_app/src/core/auth/service/firebase_auth_service.dart';
import 'package:library_app/src/core/service/dio_service.dart';
import 'package:library_app/src/core/service/remote_config_service.dart';
import 'package:library_app/src/features/book/data/book_repository.dart';
import 'package:library_app/src/features/book/data/category_repository.dart';
import 'package:library_app/src/features/common/cubit/category_list_cubit.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FirebaseAuthService(
            FirebaseAuth.instance,
          ),
        ),
        RepositoryProvider(
          create: (context) => FirebaseRemoteConfigService(
            FirebaseRemoteConfig.instance,
          )..initialize(),
        ),
        RepositoryProvider(
          create: (context) => DioService.initialize(
            Dio(),
            context.read<FirebaseAuthService>(),
            context.read<FirebaseRemoteConfigService>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            service: context.read<DioService>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => BookRepository(
            service: context.read<DioService>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => FirebaseFirestore.instance,
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
          BlocProvider(
            lazy: false,
            create: (context) => CategoryListCubit(
              categoryRepository: CategoryRepository(
                service: context.read<DioService>(),
              ),
            )..getCategories(),
          ),
          BlocProvider(
            create: (context) =>
                LibraryCubit(bookRepository: context.read<BookRepository>())
                  ..getBooks(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Library App',
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: appThemeData,
        ),
      ),
    );
  }

  final ThemeData appThemeData = ThemeData(
    primaryColor: color.primaryColor,
    splashColor: color.primaryShade,
    fontFamily: appFont.fontFamily,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: color.primaryColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(color.primaryShade),
      checkColor: WidgetStateProperty.all(color.primaryColor),
      side: BorderSide(
        width: 1.5,
        color: color.primaryColor,
      ),
    ),
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
  );
}
