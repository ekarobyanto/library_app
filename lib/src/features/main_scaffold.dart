import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/theme/app_theme.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List _navItem = [
    {
      "icon": Icons.home,
      "title": "Dashboard",
      "route": '/dashboard',
    },
    {
      "icon": Icons.people,
      "title": "Chat",
      "route": '/community-chat',
    },
    {
      "icon": Icons.edit_document,
      "title": "Reports",
      "route": '/report',
    },
    {
      "icon": Icons.person,
      "title": "Profile",
      "route": '/profile',
    },
  ];

  void _tap(int index) {
    if (index == _selectedIndex) {
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
    router.go(_navItem[index]["route"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () => router.push('/library'),
        backgroundColor: color.primaryColor,
        child: const Icon(
          Icons.book,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: color.primaryColor,
            unselectedItemColor: Colors.grey[400],
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            items: _navItem
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item["icon"]),
                    label: item["title"],
                  ),
                )
                .toList(),
            currentIndex: _selectedIndex,
            onTap: (index) => _tap(index),
          ),
        ),
      ),
    );
  }
}
