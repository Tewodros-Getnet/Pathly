class Course {
  final String id;
  final String title;
  final String description;
  final String instructorId;
  final String? thumbnailUrl;
  final String category;
  final int lessonsCount;
  final DateTime createdAt;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructorId,
    this.thumbnailUrl,
    required this.category,
    required this.lessonsCount,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "instructorId": instructorId,
      "thumbnailUrl": thumbnailUrl,
      "category": category,
      "lessonsCount": lessonsCount,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      instructorId: map["instructorId"],
      thumbnailUrl: map["thumbnailUrl"],
      category: map["category"],
      lessonsCount: map["lessonsCount"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}
