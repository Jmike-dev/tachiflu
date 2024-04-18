import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 20,
          ),
          child: SlidingClippedNavBar(
            onButtonPressed: (index) {
              setState(() {
                selectedIndex = index;
              });
              theGoBranch(selectedIndex);
            },
            backgroundColor: Colors.black,
            activeColor: Colors.blueAccent,
            iconSize: 30,
            selectedIndex: selectedIndex,
            barItems: [
              BarItem(
                title: 'Library',
                icon: Icons.collections_bookmark_outlined,
              ),
              BarItem(
                title: 'downloads',
                icon: Icons.download,
              ),
              BarItem(
                title: 'recent',
                icon: Icons.timelapse_rounded,
              ),
              BarItem(
                title: 'Search',
                icon: Icons.search,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
