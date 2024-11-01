import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/presentation/ui/workspaces_screen.dart';
import 'home/presentation/ui/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/workspaces',
  routes: <RouteBase>[
    GoRoute(
        path: '/workspaces',
        builder: (BuildContext context, GoRouterState state) {
          return const WorkspacesScreen();
          //return   const LoginScreen();
        }),
    GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
          //return   const LoginScreen();
        }),
  ],
);
