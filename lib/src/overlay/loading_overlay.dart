import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/theme/app_theme.dart';

OverlayEntry loadingOverlay = OverlayEntry(
  builder: (context) => Stack(
    children: [
      ModalBarrier(
        dismissible: false,
        color: Colors.grey.withOpacity(0.3),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SpinKitFoldingCube(
              itemBuilder: (context, index) => DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? color.primaryShade : color.primaryColor,
                ),
              ),
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: (message) => message != null
                    ? Material(
                        color: Colors.transparent,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: color.primaryColor,
                            fontSize: 16,
                          ),
                          child: Text(message),
                        ),
                      )
                    : const SizedBox.shrink(),
                orElse: () => const SizedBox.shrink(),
              );
            },
          )
        ],
      ),
    ],
  ),
);
