import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int selectedIndex = 0;

  void theGoBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            label: 'Library',
          ),
          NavigationDestination(
            icon: Icon(Icons.download_done),
            label: 'Downloads',
          ),
          NavigationDestination(
            icon: Icon(Icons.timelapse),
            label: 'Recent',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'search',
          ),
        ],
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          theGoBranch(selectedIndex);
        },
      ),
    );
  }
}
