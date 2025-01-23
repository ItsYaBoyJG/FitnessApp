import 'package:fitness_app/view/onboarding/forgot_password.dart';
import 'package:fitness_app/view/onboarding/login.dart';
import 'package:fitness_app/view/onboarding/register.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 70,
          ),
          // const WelcomeDisplay(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () async {
                  await showModalBottomSheet(
                      backgroundColor: const Color(0xffCACFD2),
                      isScrollControlled: true,
                      showDragHandle: true,
                      isDismissible: true,
                      context: context,
                      builder: (context) {
                        return const LoginPage();
                      });
                },
                child: const Text('Sign in')),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () async {
                  await showModalBottomSheet(
                      backgroundColor: const Color(0xffCACFD2),
                      isScrollControlled: true,
                      showDragHandle: true,
                      isDismissible: true,
                      context: context,
                      builder: (context) {
                        return const RegistrationPage();
                      });
                },
                child: const Text('Register')),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () async {
                  await showModalBottomSheet(
                      backgroundColor: const Color(0xffCACFD2),
                      isScrollControlled: true,
                      showDragHandle: true,
                      isDismissible: true,
                      context: context,
                      builder: (context) {
                        return const ResetPasswordPage();
                      });
                },
                child: const Text('Forgot Password')),
          ),
        ],
      ),
    );
  }
}
