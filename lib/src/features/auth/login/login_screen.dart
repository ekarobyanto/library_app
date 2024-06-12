import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/core/cubit/auth_cubit.dart';
import 'package:library_app/src/features/auth/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          signedIn: (cred) {
            context.pop();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (builder) => const Center(child: Text('loggedIN')),
            );
          },
          loading: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (builder) =>
                const Center(child: CircularProgressIndicator()),
          ),
          error: (message) {
            context.pop();
            showDialog(
              context: context,
              builder: (builder) => AlertDialog(
                title: const Text('Error Login'),
                content: Text(message),
              ),
            );
          },
        );
      },
      child: PopScope(
        canPop: context.read<AuthCubit>().state != const AuthState.loading(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const LoginForm(),
                    ElevatedButton(
                      onPressed: () => {},
                      child: const Text('login gugel'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
