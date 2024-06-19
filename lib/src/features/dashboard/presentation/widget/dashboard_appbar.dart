import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(constraints.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome user!",
                style: TextStyle(
                  fontSize: constraints.xl,
                  fontWeight: FontWeight.w600,
                  color: color.primaryShade,
                ),
              ),
              IconButton.filled(
                onPressed: () {},
                iconSize: 15,
                color: color.primaryColor,
                constraints: BoxConstraints.loose(const Size(30, 30)),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(color.primaryShade),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                icon: const Icon(Icons.notifications),
              )
            ],
          ),
          SizedBox(height: constraints.large),
        ],
      ),
    );
  }
}
