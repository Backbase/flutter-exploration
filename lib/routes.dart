import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/ui/passcode_screen.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/ui/passcode_screen_mode.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/presentation/ui/workspaces_screen.dart';

import 'home/presentation/ui/login_screen.dart';
import 'login/presentation/ui/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        }),
    GoRoute(
      path: '/passcode',
      builder: (BuildContext context, GoRouterState state) {
        return PasscodeScreen(mode: SetPasscode());
        //return   const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'confirm_passcode',
          builder: (BuildContext context, GoRouterState state) {
            return PasscodeScreen(mode: ConfirmPasscode());
          },
        ),
      ],
    ),
    GoRoute(
        path: '/workspaces',
        builder: (BuildContext context, GoRouterState state) {
          return const WorkspacesScreen();
          //return   const LoginScreen();
        }),
    GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
          //return   const LoginScreen();
        }),
  ],
);
