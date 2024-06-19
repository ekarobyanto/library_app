import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';
import 'package:library_app/src/features/auth/widgets/button_layout.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.onLogin});

  final Function() onLogin;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool obsecurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(constraints.xxl),
      child: Container(
        padding: EdgeInsets.all(constraints.xl),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(constraints.large),
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create New Account",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: constraints.large),
                    AppTextField(
                      label: "Name",
                      placeholder: "Enter your name",
                      controller: nameController,
                      leftIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      onValidate: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Name is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: constraints.medium),
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
                    SizedBox(height: constraints.medium),
                    AppTextField(
                      label: "Validate Password",
                      placeholder: "Validate your password",
                      obscureText: true,
                      leftIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      onValidate: (value) {
                        if (value != passwordController.text) {
                          return 'Wrong Password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              AuthButtonLayout(
                buttons: [
                  AppButton(
                    label: "Login",
                    onPressed: () => widget.onLogin(),
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: color.primaryShade,
                    ),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: color.primaryColor,
                    ),
                  ),
                  AppButton(
                    label: "Submit",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().emailSignUp(
                              AuthParams(
                                name: nameController.text,
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
