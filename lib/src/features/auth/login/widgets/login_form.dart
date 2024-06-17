import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';
import 'package:library_app/src/features/auth/widgets/button_layout.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/text_field.dart';

// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(constraints.xxl),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        padding: EdgeInsets.all(constraints.xl),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(constraints.large),
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Log In To Your Account",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    label: "Email",
                    placeholder: "Enter your email",
                    controller: emailController,
                    leftIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    onValidate: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Email is required.';
                      }
                      if (!EmailValidator.validate(value ?? '')) {
                        return 'Email is invalid.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: constraints.medium),
                  AppTextField(
                    label: "Password",
                    placeholder: "Enter your password",
                    controller: passwordController,
                    obscureText: true,
                    leftIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    onValidate: (value) {
                      if ((value?.length ?? 0) < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              AuthButtonLayout(
                buttons: [
                  AppButton(
                    label: "Register",
                    onPressed: () => router.push('/register'),
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: color.primaryShade,
                    ),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: color.primaryColor,
                    ),
                  ),
                  AppButton(
                    label: "Submit",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().emailSignIn(
                              AuthParams(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
