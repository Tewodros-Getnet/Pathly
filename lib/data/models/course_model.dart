import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final String instructorId;
  final String? thumbnailUrl;
  final String category;
  final int lessonsCount;
  final DateTime createdAt;
  final List<String> tags;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructorId,
    this.thumbnailUrl,
    required this.category,
    required this.lessonsCount,
    required this.createdAt,
    required this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "instructorId": instructorId,
      "thumbnailUrl": thumbnailUrl,
      "category": category,
      "lessonsCount": lessonsCount,
      "createdAt": createdAt.toIso8601String(),
      "tags": tags,
    };
  }

  factory Course.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return Course(
      id: doc.id,
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      instructorId: map["instructorId"] ?? "",
      thumbnailUrl: map["thumbnailUrl"],
      category: map["category"] ?? "General",
      lessonsCount: map["lessonsCount"] ?? 0,
      createdAt: DateTime.parse(map["createdAt"]),
      tags: List<String>.from(map["tags"] ?? []),
    );
  }
}
