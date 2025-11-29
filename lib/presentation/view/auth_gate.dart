import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_state_provider.dart';
import '../providers/user_providers.dart';

// NEW final screens we now use
import 'student_home_view.dart';
import 'instructor_home_view.dart';
import 'login_view..dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);   // listens to login/logout

    return authState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),

      error: (err, _) => Scaffold(
        body: Center(child: Text("Auth error: $err")),
      ),

      data: (firebaseUser) {
        // No Firebase user → go to login
        if (firebaseUser == null) return const LoginView();

        // Now fetch full user profile from Firestore
        final profile = ref.watch(userByIdProvider(firebaseUser.uid));

        return profile.when(
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          error: (err, _) => Scaffold(
            body: Center(child: Text("Profile Load Error: $err")),
          ),

          data: (appUser) {
            if (appUser == null) {
              return const Scaffold(
                body: Center(
                  child: Text("⚠ Profile not found in Firestore"),
                ),
              );
            }

            /// 🔥 FINAL ROLE ROUTING
            return appUser.role == "instructor"
                ? const InstructorHomeView()
                : const StudentHomeView();
          },
        );
      },
    );
  }
}
