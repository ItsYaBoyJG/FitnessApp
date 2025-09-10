import 'package:fitness_app/features/authentication/presentation/pages/auth_page.dart';
import 'package:fitness_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:fitness_app/shared/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // Watch auth state for navigation logic
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Home - Clean Architecture with Riverpod'),
          ),
        ),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Profile Screen'),
          ),
        ),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
    ],
    redirect: (context, state) {
      return authState.when(
        data: (user) {
          final isAuth = user != null;
          final isLogin = state.matchedLocation == '/auth';
          final isSplash = state.matchedLocation == '/splash';

          if (isSplash) {
            return isAuth ? '/' : '/auth';
          }

          if (isLogin) {
            return isAuth ? '/' : null;
          }

          return isAuth ? null : '/auth';
        },
        loading: () {
          // Show splash while loading
          if (state.matchedLocation != '/splash') {
            return '/splash';
          }
          return null;
        },
        error: (_, __) {
          // On error, go to auth
          return '/auth';
        },
      );
    },
  );
});