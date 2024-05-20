import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madini/screens/home_screen.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      // Add more routes as needed
    ],
    observers: [
      // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    // Uncomment and modify the following if you have authentication or other redirection logic
    
    // refreshListenable: GoRouterRefreshStream(),
    // redirect: (state) {
    //   // Example redirect logic for authentication
    //   final bool userIsLoggedIn = false; // Implement your user authentication logic
    //   if (!userIsLoggedIn && state.subloc != '/login') {
    //     return '/login';
    //   }
    //   return null;
    // },
    
  );
}