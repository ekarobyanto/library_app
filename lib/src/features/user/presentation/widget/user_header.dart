import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/src/core/auth/auth_cubit.dart';
import 'package:library_app/src/theme/app_theme.dart';

class UserHeader extends StatelessWidget {
  final bool showLogout;
  const UserHeader({
    super.key,
    this.showLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
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
              imageUrl: 'https://via.placeholder.com/150',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'johnDoe@doe.mail',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (showLogout)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => context.read<AuthCubit>().signOut(),
            ),
        ],
      ),
    );
  }
}
