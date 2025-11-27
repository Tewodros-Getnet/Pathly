import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_state_provider.dart';
import '../providers/user_providers.dart';
import 'package:pathlly/presentation/view/login_view..dart';
import 'student_home_view.dart';
import 'instructor_home_view.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return const LoginView();
        } else {
          // we have a Firebase user — fetch AppUser profile
          final userProfileAsync = ref.watch(userByIdProvider(user.uid));

          return userProfileAsync.when(
            data: (appUser) {
              if (appUser == null) {
                // Profile missing — show simple onboarding or error
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Profile not found. Please complete your profile.'),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to a simple profile-completion screen if you create one
                          },
                          child: const Text('Complete profile'),
                        )
                      ],
                    ),
                  ),
                );
              }

              // Route by role
              if (appUser.role == 'instructor') {
                return const InstructorHomeView();
              } else {
                return const StudentHomeView();
              }
            },
            loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
            error: (err, st) => Scaffold(body: Center(child: Text('Error loading profile: $err'))),
          );
        }
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, st) => Scaffold(body: Center(child: Text('Auth error: $err'))),
    );
  }
}
