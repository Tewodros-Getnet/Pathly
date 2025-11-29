import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/auth_viewmodel.dart';
import '../viewmodel/course_viewmodel.dart';

class StudentHomeView extends ConsumerWidget {
  const StudentHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pathlly — Student'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authViewModelProvider.notifier).logout(),
          )
        ],
      ),
      body: courses.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
        data: (list) {
          if (list.isEmpty) return const Center(child: Text("No courses yet 📄"));

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(list[i].title),
              subtitle: Text(list[i].description),
            ),
          );
        },
      ),
    );
  }
}
