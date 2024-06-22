import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/core/overlay/loading_overlay.dart';
import 'package:library_app/src/features/auth/listeners/auth_listener.dart';
import 'package:library_app/src/features/auth/login/widgets/login_form.dart';
import 'package:library_app/src/features/auth/register/widgets/register_form.dart';
import 'package:library_app/src/features/auth/widgets/background_decoration.dart';
import 'package:library_app/src/theme/app_theme.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final PageController pageController = PageController();
  final LoadingOverlay loadingOverlay = LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) =>
          authStateListener(context, state, loadingOverlay),
      child: PopScope(
        canPop: context.read<AuthCubit>().state != const AuthState.loading(),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: color.grayShade,
            body: SafeArea(
              child: Stack(
                children: [
                  const AuthBackgroundDecoration(),
                  PageView(
                    controller: pageController,
                    allowImplicitScrolling: false,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.1,
                          ),
                          child: LoginForm(
                            onRegister: () => pageController.animateToPage(
                              2,
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              curve: Curves.easeOut,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.1,
                          ),
                          child: RegisterForm(
                            onLogin: () => pageController.animateToPage(
                              pageController.initialPage,
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              curve: Curves.easeOut,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
