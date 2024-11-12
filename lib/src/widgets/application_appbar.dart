import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';
import 'package:library_app/src/widgets/back_button.dart';

class ApplicationAppbar extends AppBar {
  ApplicationAppbar({
    super.key,
    required String title,
    VoidCallback? onBackButtonPressed,
    PreferredSizeWidget? bottom,
    Function()? filterOnPressed,
    List<Widget>? actions,
    double elevation = 0,
  }) : super(
          toolbarOpacity: 1,
          scrolledUnderElevation: 0,
          forceMaterialTransparency: false,
          backgroundColor: Colors.white,
          leadingWidth: onBackButtonPressed != null ? 40 : 0,
          title: Text(
            title,
            maxLines: 1,
            style: TextStyle(color: color.primaryColor),
          ),
          //clarification::
          //AppBackButton and this IconButton are the same widget with different behavior, maybe i can just remove the padding but the
          //the behavior is suprisingly different :\
          leading: onBackButtonPressed != null
              ? bottom == null
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: AppBackButton(
                        onPressed: onBackButtonPressed,
                      ),
                    )
                  : IconButton(
                      onPressed: onBackButtonPressed,
                      icon: const Icon(Icons.chevron_left),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(color.primaryShade),
                      ),
                      color: color.primaryColor,
                    )
              : const SizedBox(),
          automaticallyImplyLeading: false,
          bottom: bottom,
          actions: filterOnPressed != null
              ? [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_rounded),
                    color: color.primaryColor,
                  ),
                ]
              : (actions ?? []),
        );
}
