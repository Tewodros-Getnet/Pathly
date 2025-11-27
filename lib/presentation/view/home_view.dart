import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathlly/presentation/viewmodel/auth_viewmodel.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pathly Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(authViewModelProvider.notifier).logout();
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
