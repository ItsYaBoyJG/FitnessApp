import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/views/auth/onboarding.dart';
import 'package:fitness_app/views/home.dart';
import 'package:fitness_app/views/profile/creation/creation_summary.dart';
import 'package:fitness_app/views/profile/creation/fields/activity.dart';
import 'package:fitness_app/views/profile/creation/fields/goal_reasons.dart';
import 'package:fitness_app/views/profile/creation/fields/goals.dart';
import 'package:fitness_app/views/profile/creation/fields/height_weight.dart';
import 'package:fitness_app/views/profile/creation/totals/totals.dart';
import 'package:fitness_app/views/profile/profile.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
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
        return const ActivityContainer();
      },
    ),
    GoRoute(
      path: '/goals',
      builder: (context, state) {
        return const GoalsContainer();
      },
    ),
    GoRoute(
      path: '/goalreasons',
      builder: (context, state) {
        return const GoalReasonsContainer();
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
    )
  ],
  redirect: (context, state) {
    final isAuth = FirebaseAuth.instance.currentUser;
    final bool isLogin = state.matchedLocation == '/onboarding';

    if (isAuth == null) {
      return '/onboarding';
    }

    if (isLogin) {
      return '/';
    }
    return null;
  },
);
