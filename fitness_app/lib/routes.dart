import 'package:fitness_app/providers/stream_providers.dart';
import 'package:fitness_app/utils/splash_screen.dart';
import 'package:fitness_app/view/account/activity_view.dart';
import 'package:fitness_app/view/account/goal_reasons_view.dart';
import 'package:fitness_app/view/account/goals_view.dart';
import 'package:fitness_app/view/onboarding/onboarding.dart';
import 'package:fitness_app/view/home.dart';
import 'package:fitness_app/view/account/creation_summary.dart';
import 'package:fitness_app/view/account/fields/height_weight.dart';
import 'package:fitness_app/view/account/totals/totals.dart';
import 'package:fitness_app/view/profile/profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(userAuthStateProvider);
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Home();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return const ProfilePage();
        },
      ),
      GoRoute(
        path: '/heightandweight',
        builder: (context, state) {
          return const HeightWeightContainer();
        },
      ),
      GoRoute(
        path: '/activity',
        builder: (context, state) {
          return const ActivityView();
        },
      ),
      GoRoute(
        path: '/goals',
        builder: (context, state) {
          return const GoalsView();
        },
      ),
      GoRoute(
        path: '/goalreasons',
        builder: (context, state) {
          return const GoalReasonsView();
        },
      ),
      GoRoute(
        path: '/creationsummary',
        builder: (context, state) {
          return const CreationSummary();
        },
      ),
      GoRoute(
        path: '/dailytotals',
        builder: (context, state) {
          return const DailyTotalsSumPage();
        },
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      )
    ],
    redirect: (context, state) {
      final isAuth = authState.valueOrNull != null;
      final bool isLogin = state.matchedLocation == '/onboarding';
      final bool isSplash = state.matchedLocation == '/splash';

      if (authState.isLoading || authState.hasError) {
        return null;
      }

      if (isSplash) {
        return isAuth ? '/' : '/onboarding';
      }

      if (isLogin) {
        return isAuth ? '/' : null;
      }

      return isAuth ? null : '/splash';
    },
  );
});
