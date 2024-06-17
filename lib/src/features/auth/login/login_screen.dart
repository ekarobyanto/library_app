import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/auth/login/listeners/auth_listener.dart';
import 'package:library_app/src/features/auth/login/widgets/login_form.dart';
import 'package:library_app/src/features/auth/widgets/background_decoration.dart';
import 'package:library_app/src/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: authStateListener,
      child: PopScope(
        canPop: context.read<AuthCubit>().state != const AuthState.loading(),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: color.grayShade,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    const AuthBackgroundDecoration(),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.1,
                      ),
                      child: const LoginForm(),
                    ),
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
