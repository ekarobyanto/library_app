import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/features/auth/models/auth_params.dart';
import 'package:library_app/src/router/router.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

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
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!EmailValidator.validate(value ?? '')) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name (Optionals)'),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: () =>
                    setState(() => obsecurePassword = !obsecurePassword),
                icon: obsecurePassword
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            obscureText: obsecurePassword,
            validator: (value) {
              if ((value?.length ?? 0) < 6) {
                return 'Password must be at least 6 characters long.';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value != passwordController.text) {
                return 'Check your password.';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthCubit>().emailSignUp(
                      AuthParams(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                      ),
                    );
              }
            },
            child: const Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () => router.pop(),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
