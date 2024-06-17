import 'package:flutter/material.dart';
import 'package:library_app/src/features/auth/register/widgets/register_form.dart';
import 'package:library_app/src/features/auth/widgets/background_decoration.dart';
import 'package:library_app/src/theme/app_theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: const RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
