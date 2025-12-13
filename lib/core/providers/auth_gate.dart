import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/Auth_UI/login_view..dart';
import '../../presentation/view/instructor/instructor_home_view.dart';
import '../../presentation/view/student/student_home_view.dart';
import 'auth_state_provider.dart';
import 'user_providers.dart';

// NEW final screens we now use

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

        if (firebaseUser == null) return const LoginView();

        final profile = ref.watch(userByIdProvider(firebaseUser.uid));

        return profile.when(
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.blue)),),
          error: (err, _) => Scaffold(
            body: Center(child: Text("Profile Load Error: $err")),),
          data: (appUser) {
            if (appUser == null) {
              return Scaffold(
                body: Center(
                  child: Text("No profile found. Please create one."),
                ),
              );
            }
            return appUser.role == "instructor"
                ? const InstructorHomeView()
                : const StudentHomeView();
          },
        );
      },
    );
  }
}



// if (appUser == null) {
// return Scaffold(
// body: Center(
// child: ElevatedButton(
// onPressed: () async {
// await UserRepository().saveUser(
// AppUser(
// id: firebaseUser.uid,
// name: firebaseUser.email!.split("@")[0],
// email: firebaseUser.email!,
// role: "student",
// photoUrl: null,
// createdAt: DateTime.now(),
// ),
// );
// },
// child: const Text("Create Profile"),
// ),
// ),
// );
// }
