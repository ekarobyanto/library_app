import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/theme/app_theme.dart';

class UserHeader extends StatelessWidget {
  final bool showLogout;
  final Color backgroundColor;
  const UserHeader({
    super.key,
    this.showLogout = false,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final user = context
        .watch<AuthCubit>()
        .state
        .whenOrNull(signedIn: (userCred) => userCred);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(120)),
              border: Border.all(
                width: 1.5,
                style: BorderStyle.solid,
                color: color.primaryColor,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: user?.photoURL ?? 'https://via.placeholder.com/150',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.displayName ?? ':)',
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user?.email ?? ':)',
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (showLogout)
            IconButton(
              icon: Icon(Icons.logout, color: color.primaryColor),
              onPressed: () => context.read<AuthCubit>().signOut(),
            ),
        ],
      ),
    );
  }
}
