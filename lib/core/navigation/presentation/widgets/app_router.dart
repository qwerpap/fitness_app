import 'package:fitness_app/core/navigation/presentation/screens/scaffold_with_nav_bar.dart';
import 'package:fitness_app/features/main_screen/view/main_screen.dart';
import 'package:fitness_app/features/onboarding_screen/view/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
      ),
      StatefulShellRoute(
        builder: (context, state, navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (context, navigationShell, children) {
          return ScaffoldWithNavBar(
            navigationShell: navigationShell,
            children: children,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const MainScreen(),
              ),
            ],
          ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: '/statistics',
          //       builder: (context, state) => const StatisticsScreen(),
          //     ),
          //   ],
          // ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: '/profile',
          //       builder: (context, state) => const ProfileScreen(),
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );
}
