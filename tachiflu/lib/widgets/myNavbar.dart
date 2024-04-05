import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void theGoBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        // height: ,
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            label: 'Library',
            icon: Icon(Icons.collections_bookmark_outlined),
          ),
          NavigationDestination(
            label: 'recent',
            icon: Icon(Icons.timelapse_rounded),
          ),
          NavigationDestination(
            label: 'search',
            icon: Icon(Icons.search),
          ),
        ],
        onDestinationSelected: theGoBranch,
      ),
    );
  }
}
