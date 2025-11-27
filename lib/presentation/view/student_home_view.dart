import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/auth_viewmodel.dart';

class StudentHomeView extends ConsumerWidget {
  const StudentHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pathlly — Student')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.read(authViewModelProvider.notifier).logout(),
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
