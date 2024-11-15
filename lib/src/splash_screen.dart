import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/book/cubit/all_book_cubit.dart';
import 'package:library_app/src/features/common/cubit/category_list_cubit.dart';
import 'package:library_app/src/features/library/presentation/cubit/library_cubit.dart';
import 'package:library_app/src/features/report/cubit/report_cubit.dart';
import 'package:library_app/src/router/router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(signedIn: (cred) {
          context.read<CategoryListCubit>().getCategories();
          context.read<LibraryCubit>().getBooks();
          context.read<ReportCubit>().getReport(false);
          context.read<AllBookCubit>().getAllBook();
          router.go('/dashboard');
        }, signedOut: () {
          router.go('/auth');
        }, error: (_) {
          router.go('/auth');
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/images/um.jpg'),
        ),
      ),
    );
  }
}
