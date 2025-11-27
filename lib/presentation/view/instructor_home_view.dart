import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/auth_viewmodel.dart';

class InstructorHomeView extends ConsumerWidget {
  const InstructorHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pathlly — Instructor')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.read(authViewModelProvider.notifier).logout(),
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
