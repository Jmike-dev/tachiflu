import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tachiflu/routes/route_name.dart';
import 'package:tachiflu/screens/download/download_screen.dart';
import 'package:tachiflu/screens/library/library_screen.dart';
import 'package:tachiflu/screens/recents/recents_screen.dart';
import 'package:tachiflu/screens/search/search_screen.dart';
import 'package:tachiflu/widgets/my_navbar.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final definedRoutes = GoRouter(
  initialLocation: '/library',
  navigatorKey: rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MyNavbar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/library',
              name: RouteNames.library,
              builder: (context, state) {
                return const LibraryScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavigatorDKey,
          routes: [
            GoRoute(
              path: '/downloads',
              name: RouteNames.downloads,
              builder: (context, state) {
                return const DownloadScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavigatorBKey,
          routes: [
            GoRoute(
              path: '/recent',
              name: RouteNames.recent,
              builder: (context, state) {
                return const RecentScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavigatorCKey,
          routes: [
            GoRoute(
              path: '/search',
              name: RouteNames.search,
              builder: (context, state) {
                return const SearchScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
