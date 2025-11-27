class Lesson {
  final String id;
  final String courseId;
  final String title;
  final String videoUrl;
  final int order;
  final DateTime createdAt;

  Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.videoUrl,
    required this.order,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "courseId": courseId,
      "title": title,
      "videoUrl": videoUrl,
      "order": order,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map["id"],
      courseId: map["courseId"],
      title: map["title"],
      videoUrl: map["videoUrl"],
      order: map["order"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}
